---
title: "Give up on CI/CD"
date: 2020-09-08T22:20:29-07:00
draft: false
author: "Eric Hotinger"

description: "In this blog, the author challenges the conventional wisdom that true CI/CD is necessary for software businesses. They argue that it is impractical and unrealistic to expect immediate production deployment for every commit and can result in more problems than benefits. Instead, the author suggests a more measured approach to software deployment, one that fits the needs of the business and development team. The author highlights the challenges of true CI/CD for large systems and the importance of not breaking customers. They emphasize the need to strike a balance between fast deployment and stability, and recommend using CI/CD for QA/integration staging environments, but not for production. The blog is a thought-provoking read for software professionals who want to rethink their approach to software deployment."

tags:
- meta
- software
- integration

categories:
- software
- meta
- integration

slug: give-up-on-ci-cd
---

Give up on your glorious vision of CI/CD. I don't want it and your customers don't either. If you break me one more time this month I will lose my mind and start looking at competitors. I can afford to wait 3 months for your new features. On second thought, I don't care if I get any new features ever again.

I've written software whose sole purpose was to make CI/CD better. I've heard from so many developers and managers how CI/CD will change the world. It hasn't in the last 5 years and it never will. First of all, allow me to clarify - I mean *true* CI/CD - where every commit you make immediately rolls out to production. It's idyllic and naive. It is wholly impractical for the majority of software businesses. 

So you want to build CI/CD that only deploys your code to some QA/integration staging environment? Yes. Please. Always do that. Just don't immediately push it to production afterwards.

In established software businesses and enterprises, you can almost always afford to wait and do deployments slower. Make a release cadence that fits your business and development team. Ask yourself: are we losing or not gaining customers because we are not shipping code fast enough? Fix problems that affect your customers.

There is a zero percent chance customers are leaving you because you don't ship code every day. If you kick ass, maybe you can try to ship to prod every week. As your business evolves, maybe it is every two weeks or a month. It is incredibly important to not break your customers and stay available. That's a huge part of why they keep using your service. I don't always want the greatest and latest features. A lot of the features you release don't even matter to me.

Your tests will not catch every regression before it hits prod, no matter how good your QA and dev teams think they are. Any system at serious scale has problems replicating production workloads in staging environments before it hits prod. You are not special.

Once upon a time I worked on a real time eventing system. When you are handling millions of events a second, you cannot afford to accidentally log too many messages or metrics because you put a multiplier on the throughput of the system. All of a sudden your 1M RPS turns into 5M RPS to some dependency service. You get called in the middle of the night when CPUs and memory are on fire because someone checked in a log statement. Imagine how hard it is to replicate that same load and every single customers' use case in a testing/QA staging environment. And automatically deploy it after the system verifies "it looks good." You can try, but almost nobody is successful.

Solving true CI/CD for big systems is incredibly challenging. For small businesses and startups, if you try to do that and get 100% coverage, you will go extinct. For massive companies it is a wild undertaking and rarely successful. At that point you're making a gamble on whether or not it pays off instead of investing in other strategic areas.

Please use CI/CD for QA/integration staging environments. Don't do it for production. Remove the C from those words for production. That doesn't mean your deployments have to be a "big event." They shouldn't be. But leave them as a few button clicks.