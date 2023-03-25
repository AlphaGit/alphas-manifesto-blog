---
excerpt_separator: <!--more-->
title: Blender on Lambda
subtitle: Rendering Blender Scenes in AWS Lambda
categories:
  - Development
tags:
  - Terraform
  - Infrastructure
  - Automated Workflows
header:
  image: assets/lambda.webp
  image_description: AWS Lambda
description: >-
  Learn how I used AWS Lambdas and Docker containers to create a distributed
  rendering engine with the Producer-Queue-Consumer pattern. I discuss the
  architecture and how to execute Blender from the command line, as well as how
  to debug with Docker and RIE. Check out my GitHub repository for the source
  code.
---


[GitHub repository](https://github.com/AlphaGit/blender-lambda)

I recently published [TAS-PC](https://blog.alphasmanifesto.com/2021/11/22/tas-pc/), a producer-queue-consumer lambda terraform module. This was an intermediate step for creating a distributed rendering engine.

In this post I'd like to discuss some of the technical aspects of that work.

<!--more-->

## Why Lambdas?

Image / 3D Rendering is a process that is perfectly suited for GPUs. However, due to multiple reasons, it is incredibly difficult and expensive to get hold of a good GPU. Using cloud-based GPUs is entirely possible, but they require the "manual" setup of EC2 instances might be a bit troublesome. Also, the start up, the detection of the job completion, the termination and the bidding for spot instances (which are the only ones with GPUs in an acceptable range) seemed like a lot of work.

So instead I chose to use docker containers and lambdas. Sure, lambdas are currently only CPU-based, but they are highly paralellizable. This is a huge timesaver, and if the execution time of each lambda is under an acceptable value, the final result is not only ready in a fast timeframe, but also cost-effective.

## Architecture

As explained in the [TAS-PC](https://blog.alphasmanifesto.com/2021/11/22/tas-pc/) post, this is a producer-queue-consumer pattern used for serverless loads.

### Producer

The producer function is tied to an AWS API Gateway endpoint, so that it can be invoked with parameters decided from the client side, and at will. This function:

- Validates that the needed files are present in the right S3 bucket
- Validates that the rendering parameters are under acceptable values (like frame ranges)
- Queues one message per frame on an SQS queue

### Queue

The SQS queue does not have much to mention, aside from a tweaked visibility timeout. It's currently set for about 5 minutes, which in my experiments, is a bit longer than how long a 1920x1080 frame takes to get rendered. This ensures that if any function fails to render the scene, it will get retried, only a specific number of times.

I did not setup a dead letter queue because the failure will be obvious from the missing rendered frames and the message itself is not important. However, on another kind of application, it would be important to store the failed message on a dead letter queue for further analysis of the problem.

### Consumer

The consumer function downloads the rendering scene files and any support files specified. An alternative to this is to have all the files embedded in the scene file, but this is just troublesome, so this works as a nice second option.

## Executing Blender

While [Blender can be executed from the command line](https://docs.blender.org/manual/en/latest/advanced/command_line/render.html), it didn't give me full control of the operations and parameters. So I opted for using the `bpy` plugin system, which is basically a scripting module to use in it.

## Lambda image container

Getting Blender installed in a docker image is not a trivial task, but fortunately, the NYTimes Research team has already done it for us: [Blender-Docker](https://github.com/nytimes/rd-blender-docker).

An interesting bit is that files need to be setup with `644` permissions and directories with `755` so that it can run correctly in AWS Lambda. Also, the inclusion of `awslambdaric` as an entrypoint allows not only the execution of lambda but local debugging to.

For local debugging, the instructions in [the lambda docs](https://docs.aws.amazon.com/lambda/latest/dg/images-test.html#images-test-add) are perfect, but as a quick note, here are the commands to execute:

```bash
# Install RIE (Runtime Interface Emulator)
mkdir -p ~/.aws-lambda-rie
curl -Lo ~/.aws-lambda-rie/aws-lambda-rie 
https://github.com/aws/aws-lambda-runtime-interface-emulator/releases/latest/download/aws-lambda-rie
chmod +x ~/.aws-lambda-rie/aws-lambda-rie

# Build our local docker image
docker build -t lambdatest .

# Run the docker image using RIE as the entry point
docker run \
  -v ~/.aws-lambda-rie:/aws-lambda \
  -p 9000:8080 \
  --entrypoint /aws-lambda/aws-lambda-rie \
  lambdatest \
  /bin/2.93/python/bin/python3.9 -m awslambdaric consumer_function.handler

# In a separate console, run the exposed function
curl -XPOST http://localhost:9000/2015-03-31/functions/function/invocations -d '{ "Records": [{ "body": { "filename": "scene.blender" } }] }'
```

This should be enough to verify that it is all running correctly before sending it to the cloud.
