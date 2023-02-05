---
title: "Automating Newsletters With Hugo, TinyLetter, and Zapier"
date: 2023-02-05T13:01:11-08:00
draft: false

categories:
- development
- software

tags:
- software
- development
---

# Automating Newsletters With Hugo, TinyLetter, and Zapier

This short post will teach you how to automatically send emails using [Zapier](https://zapier.com/) to an email subscription list on [TinyLetter](https://www.tinyletter.com/) for a personal blog created using [Hugo](https://gohugo.io/).

The setup takes about 10 minnutes and is completely free until you have over 5000 subscribers. If you reach that point, your blog is so successful it'd be worth it to spend a few bucks!

1. Create your TinyLetter account on https://www.tinyletter.com. This service is a personal newsletter service created by the owners of MailChimp. Configure the newsletter that you've created however you like.
2. Set up your Zapier account. Zapier is a service that allows you to specify a trigger and take an action. It's similar to "If This, Then That." You can use it to trigger an action whenever your Hugo site's RSS feed gets updated and draft an email to your newsletter.
3. Create a new Zap in Zapier:
    - Configure the trigger to be an RSS feed.
    - Customize the Feed URL to be the RSS URL in your Hugo blog. For example, in my case it's https://ehotinger.com/index.xml.
    - Configure the action to be an outbound email.
    - For the "To" field, you'll want to send an email directly to your Newsletter. This is a hidden URL in TinyLetter which you can find via https://tinyletter.zendesk.com/hc/en-us/articles/360006275733-Sending-your-newsletter-from-your-own-email-client
4. Test and enable your Zap.

That's it, have fun. Oh, and please subscribe to my TinyLetter: https://tinyletter.com/ehotinger
