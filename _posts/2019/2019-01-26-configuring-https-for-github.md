---
excerpt_separator: <!--more-->
title: Configuring HTTPS for project GitHub Pages custom subdomain
categories:
    - Technology
tags:
    - https
    - GitHub
    - GitHub Pages
    - DNS
subtitle: How to configure HTTPS while keeping control of the nameservers
---

As a final step to moving my blog to GitHub pages, it was the matter of setting up HTTPS. The GitHub guides are very detailed on this. So much that it's easy to get lost in them.

My case was particular, as it was a combination of a lot of conditions:

- My repository is a *project* repository (it is not a repository named after my user or my organization).
- I don't want to transfer the whole domain DNS (apex domain) to GitHub nameservers, since I might want to use other subdomains (or the main domain) for my own purposes.
- I want the blog to have HTTPS enabled, even when only static content is served.

I couldn't find anywhere how to setup the configuration for a case like this, but it's really easy.

<!--more-->

This is all taking benefit that DNS is a hierarchical system -- so subdomains can have their own configuration, independent of the domain.

## Step 1: Setup an alias for your subdomain

![]({{ site.baseUrl }}/assets/2019-01-26-configuring-https-for-github/dnsRecords.png)

Just setup a `CNAME` DNS record that points to `<youruser>.github.io`. Yes, this even applies in the case where you are using a project repository, like my case.

## Step 2: Setup your subdomain in GitHub

In the settings page of your repository, make sure that you add your subdomain information.

![]({{ site.baseUrl }}/assets/2019-01-26-configuring-https-for-github/repositorySubdomain.png)

## Step 3: Enable HTTPS

In the same page, click the checkbox that enables HTTPS.

Then you need to wait until the actual certificates are generated -- it could take a while. GitHub says that it could take 24 hours. In my experience, it took about 1 hour.

![]({{ site.baseUrl }}/assets/2019-01-26-configuring-https-for-github/enforceHttps.png)

If you keep coming back to this page, it will tell you if it's pending. Otherwise, you'll see the checkbox enabled and no particular notices on it.

You will also see that on top of that section, GitHub says _"Your site is ready to be published at &lt;your domain&gt;."_

## You're all done!

This configuration should be good enough. This allows you to keep using DNS for any other shenanigams you want to proceed to. It also allows you to host a huge amount of repository pages (even from different users!) under your domain.