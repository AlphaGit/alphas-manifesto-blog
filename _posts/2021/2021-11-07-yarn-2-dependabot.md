---
excerpt_separator: <!--more-->
title: Using Dependabot with Yarn 2
subtitle: Not currently supported out of the box
categories:
  - Development
tags:
  - GitHub
  - Automated Workflows
header:
  image: assets/automatic-merges-header.webp
  image_description: Automatic merges
description: >-
  Learn how to migrate a project to TypeScript and Yarn 2, and fix Dependabot's
  lack of Yarn 2 support with a workaround. Automatically merge Pull Requests
  with github actions to ensure that everything is alright.
---


A few weeks ago I migrated [worklogger](https://github.com/AlphaGit/worklogger) to TypeScript and yarn 2.

But this broke some things along the way.

<!--more-->

I found out about Yarn 2 by pure accident, I was looking into its documentation for something and I realized Yarn 1.4 is way below the latest.

Turns out that the Yarn 2 adoption is not quite great, but Yarn 2 offers a huge amount of benefits over Yarn 1. The best of these is [zero-installs](https://yarnpkg.com/features/zero-installs): a full-packaged version of dependencies in your own repo, without the huge problem that the `node_modules` folder usually involved.

![Heaviest objects in the universe]({{ site.baseurl }}/assets/node/node_modules_weight.webp)

This update broke my current automated workflow, which included:

- **Dependabot**: Detecting new versions of the dependencies and opening Pull Requests for them,
- **GitHub Actions**: Running unit tests on different node versions and verifying the update still works,
- **License Compliance**: Verifying the included dependencies so that I don't find myself in legal trouble
- **Git Guardian**: Verifying that no secrets are leaked into the repository
- **Mergify**: Automatically merging the PR if everything passes (and if this is a dependabot PR, of course).

It broke because [Dependabot does not have support for Yarn 2](https://github.com/dependabot/dependabot-core/issues/1297). I took the time to read through the full list of comments, and aside from people arguing on whether it should be a priority or not based on Yarn's popularity, the reality is that the support is not there yet. At the moment of writing this, [GitHub's official roadmap](https://github.com/github/roadmap/projects/1) it doesn't seem like Dependabot is going to have any new ecosystems added to it.

The workaround, which I'll show in detail below, involves:

- intercepting the Dependabot PR with a GitHub action
- having that action checkout the repository (including LFS pull for the `.yarn` folder)
- having yarn install the new dependencies (which will work because `package.json` will be updated)
- having yarn de-upde dependencies (just in case)
- committing the changes to the `yarn.lock` file
- pushing the changes (with a custom personal access token)

This will trigger the rest of the workflows in GitHub action, making almost everything come back to normal.

This is all required because while Dependabot will update the `package.json` dependencies, it will not correctly generate a yarn.lock valid file for yarn 2.

Here's the code that made this work for me, heavily inspired in [this Gist](https://gist.github.com/amacneil/60bf679f357bad9d62103cfdc86cbd74):

```yaml
{% raw  %}# Automatically save updated `yarn.lock` file for dependabot PRs.
# This is necessary because dependabot doesn't support Yarn v2 yet:
# https://github.com/dependabot/dependabot-core/issues/1297
#
# Note: We use the `pull_request_target` event due to GitHub security measures.
#       It is important to ensure we don't execute any untrusted PR code in this context.
# See: https://github.blog/changelog/2021-02-19-github-actions-workflows-triggered-by-dependabot-prs-will-run-with-read-only-permissions/
#      https://securitylab.github.com/research/github-actions-preventing-pwn-requests

# Inspired from https://gist.github.com/amacneil/60bf679f357bad9d62103cfdc86cbd74
name: Dependabot
on:
  - pull_request_target

jobs:
  fix-lockfile:
    runs-on: ubuntu-latest
    if: |
      github.actor == 'dependabot[bot]' &&
      contains(github.event.pull_request.head.ref, 'dependabot/npm_and_yarn/')

    # IMPORTANT: setting YARN_ENABLE_SCRIPTS=false is critical to ensure that untrusted
    # PRs can't add an npm package and then use that to execute untrusted code in
    # a trusted context. See links at the top of this workflow for further details.
    # See also: https://github.com/yarnpkg/berry/issues/1679#issuecomment-669937860
    env:
      YARN_ENABLE_SCRIPTS: false
      YARN_ENABLE_IMMUTABLE_INSTALLS: false

    steps:
      - uses: actions/checkout@v2.3.5
        with:
          # Using a Personal Access Token here is required to trigger workflows on our new commit.
          # The default GitHub token doesn't trigger any workflows.
          # See: https://github.community/t/push-from-action-does-not-trigger-subsequent-action/16854/2
          token: ${{ secrets.DEPENDABOT_PAT }}
          ref: ${{ github.event.pull_request.head.ref }}
          fetch-depth: 2

      - run: git lfs pull --include .yarn/

      - name: Setup node
        uses: actions/setup-node@v2.4.1
        with:
          node-version: 16.x

      - name: Restore cache
        uses: actions/cache@v2.1.4
        with:
          path: .yarn/cache
          key: ${{ runner.os }}-yarn-${{ hashFiles('**/yarn.lock') }}
          restore-keys: ${{ runner.os }}-yarn-

      - run: git checkout HEAD~1 yarn.lock

      - run: yarn install --mode=skip-build

      - run: yarn dedupe

      - name: Commit yarn.lock
        run: |
          git config user.name "dependabot-fix"
          git config user.email "dependabot-fix@example.com"
          git add yarn.lock
          git commit -m '[dependabot skip] Fix yarn.lock'
          git push{% endraw %}
```

Finally, after this, the only work remaining is making sure that the test happens, and that it correctly confirms that everything is alright:

```yaml
name: Run tests

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        node-version: [12.x, 14.x, 16.x]

    steps:
    - name: Check out code
      uses: actions/checkout@v2

    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v2
      with:
        node-version: ${{ matrix.node-version }}
        cache: 'yarn'

    - run: yarn install

    - run: yarn test:all
```

And, in case you're curious, this is how it gets merged making sure everything's alright:

```yaml
pull_request_rules:
  - name: Dependabot automatic merges
    conditions:
      - author~=^dependabot(|-preview)\[bot\]$
      - check-success=build (12.x)
      - check-success=build (14.x)
      - check-success=build (16.x)
      - "#check-failure=0"
    actions:
      merge:
        method: squash
```

This is the beauty of automation:

[![Automatic merge]({{ site.baseurl }}/assets/automatic-merges.webp)]({{ site.baseurl }}/assets/automatic-merges.webp)