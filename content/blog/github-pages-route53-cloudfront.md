---
title: "GitHub Pages, Route 53, Cloud Front, and SSL"
date: 2019-08-31T00:05:35-07:00
draft: false

tags:
- AWS

categories:
- AWS
- development

slug: github-pages-aws-ssl
---

This is how I set up my blog which uses GitHub pages to have a custom domain and SSL all on AWS for $12/year -- just the cost of the `.com`. The other services are all in the free-tier.

## Register your domain

Use Route 53: https://aws.amazon.com/route53/

- All you have to do here is go through the Register Domain workflow that Amazon has created. It'll allow you to buy a domain name of your choice for about $12 (for a `.com`) and automatically create the Hosted Zone for you
- The Hosted Zone will come with a NS and SOA record to start with, we'll add more to this later

## Create the certificate

Use ACM: https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html

- Request a public certificate
- Add on any domain names you want, i.e. `*.username.com` and `username.com` - this enables you to handle requests with/without `www`
- Fill in the CNAME records in the Route 53 test you created earlier to do the validation tests (there's a button to create the CNAMEs after the certificate is created to verify them, just click it)

## Set up Cloud Front

Use Cloud Front: https://aws.amazon.com/cloudfront/

- Create a new Web Distribution
- Set the origin domain name to `username.github.io`
- Set `Viewer Protocol Policy` to `Redirect HTTP to HTTPS`
- For `Allowed HTTP Methods`, you might want `GET, HEAD, OPTIONS`
- Modify any of the defaults if you desire, nothing else is required (you may want to customize the caching to be lower to see/test changes faster)
- Add in CNAME records for `www.username.com` and `username.com`
- Use the SSL certificate you generated in the previous step
- Wait about 15 mins for the distribution to deploy

## Back to Route 53

- Create an `A` record with an alias to your Cloud Front distribution (`username.com.` -> `cloud front`)
- Create a `CNAME` record for `www.username.com.` to `username.com`

## On GitHub

- Go to your GitHub pages repository and click on Settings
- Add in your custom domain name (`username.com`)
- Enforce HTTPS

## Aftermath

Hopefully you're all done! You should be able to visit `www.username.com`, `username.com`, as well as any other variants and automatically have requests routed with SSL.