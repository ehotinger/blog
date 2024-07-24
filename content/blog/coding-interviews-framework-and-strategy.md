---
title: "Coding Interviews: Framework and Strategy"
date: 2023-01-08T12:22:00-08:00
draft: false
author: "Eric Hotinger"

description: "A comprehensive guide to ace your coding interviews at tech giants like Google, Meta, Netflix, Microsoft, and Amazon."

tags:
- interviews
- system design
- cloud architecture
- distributed systems
- scalability
- cloud computing
- leetcode

categories:
- interviews
- system design
- cloud architecture
- distributed systems
- scalability
- cloud computing
- leetcode

slug: coding-interviews-framework-and-strategy
---

# Coding Interviews: Framework and Strategy

The goal of this post is to provide you with a reliable strategy and framework for general coding and technical interviews. At the end, I provide a rough calibration guide to be used in any coding interview so that you can evaluate your performance and others' performance with mock practice once you understand the framework and strategies.

## The Framework

Every coding interview can be broken into four high-level steps:

1. Requirements
2. High-level Design
3. Coding
4. Follow-ups

**Important:** After the first step and for each subsequent step, kindly ask your interviewer if it is okay to move on to the next step or if they feel there is anything else important to discuss first. Between each step, they should tell you whether they want to continue discussion on a particular topic. This will help you manage their expectations and ensure that you work on the components that the interviewer feels are important to discuss. It's also easy to talk about a topic for too long or for not long enough, so this will help you spend the right amount of time on each topic.

## 1. Requirements
In this step, your goal is to ask questions to remove any ambiguity in the problem statement and define the requirements. Take time to ask clarifying questions as needed.

## 2. High-level Design
Come up with an initial brute-force approach to the problem statement and evaluate its time and space complexity. Think if you can solve the problem in a more optimal manner and discuss the pros/cons of various approaches with your interviewer. If needed, write down some pseudocode or rough notes to sketch out the algorithm and help your interviewer understand your ideas. Run through the complexity of the solution. Get your interviewer's sign off on the desired approach before you proceed further.

## 3. Coding

Once you have your high-level idea signed off, all that's left is to implement it. This is typically the most challenging area and where you will spend nearly all of your time.

Once you've completed the code, run through the test cases, consider boundary conditions, and error cases. Demonstrate why your solution works to your interviewer. Explain the space and time complexity of the solution and potential optimizations.

### 3.1 - Tips

1. Practice makes perfect. Complete a ton of practice problems using various online resources; there is no secret guidance to success when it comes to execution.
2. If you do a good job in the high-level design and write enough rough pseudocode, this step can get significantly easier because you simply have to delete the pseudocode and implement real code over top of it. I suggest writing high-level comments as a minimum during the design phase, just as placeholders for yourself.
3. For trivial functions, feel free to use small utility functions without necessarily implementing all of the code. Interviewers will understand what you're intending the function to do and it can save you time in terms of the implementation. If you have time at the end, you can loop back and fill out the rest of the implementation. This will keep your code logical and maintainable. However, be pragmatic and balanced. Do not write total pseudocode with zero actual implementation anywhere.

## 4. Follow-ups

By now, you've finished coding the core problem. Your interviewer may ask follow-up questions to make variations on the problem to make it more challenging. They may also invite you to optimize certain areas.

## 5. Time Management

In general, for a 45-minute coding interview, expect to spend roughly these time allocations on each step:

1. [3 - 5 minutes] Requirements
2. [3 - 5 minutes] high-level Design
3. [15 - 25 minutes] Coding
4. [10 - 15 minutes] Follow-ups

If you are ever unsure how long you will get for your coding interview, simply ask your recruiter how long you should expect to spend in the session, and how long you will get to do the coding interview. Most interviews are 60 minutes so you will spend anywhere from 45-50 minutes on coding and 10-15 minutes on behavioral questions, team fit, and introductions. If the time allocation for a particular company is different, adjust your strategy ahead of time and practice it!

## 6. Calibration Guide

Below is a calibration guideline which applies to all coding interviews. Fill in the brackets with a checkmark and ask yourself whether you accomplished all of them. If you didn't, try to correct it going forward.

- [] Takes time to ask clarifying questions before jumping into code.
- [] Removes ambiguity from problem statement.
- [] Thinks about optimizations before coding. Run through the time complexity and volunteer it to the interviewer
- [] Code is clean and maintainable.
- [] Code is logical.
- [] Understands the language of their choice and uses its internal tools and frameworks effectively.
- [] Completed the problem in the allocated time.
- [] Runs through tests and explains why it works
- [] Considers extra boundary conditions without advice.
- [] Comments on and understands the final time and space complexity.

## 7. Closing Thoughts and Final Tips

- Generally speaking, it's better to finish the solution and refactor it later. Don't obsess about how clean it is until it is working - you will lose time.
- You don't have to explain what you're doing the entire time. If you get stuck, take a minute and be silent if you need to. Tell the interviewer you need a minute to think in silence and what you are going to think about. That being said, don't wait in silence for too long - seek out hints or tips if you are stuck.
- Use resources like [https://leetcode.com/](https://leetcode.com/) and [HackerRank](https://www.hackerrank.com/) to practice. Practice makes perfect. You can find some of my personal practice and solutions here:
    - https://github.com/ehotinger/hackerrank
    - https://github.com/ehotinger/leetcode

## 8. Related Posts
Thanks for reading this far. Be sure to check out all of my related technical interview practice posts:

- [System Design Interview Framework & Strategy](https://ehotinger.com/blog/system-design-interviews-framework-and-strategy/)
- [Behavioral Interview Framework & Strategy](https://ehotinger.com/blog/behavioral-interviews-framework-and-strategy/)
- [Technical Program Management (TPM) Example Interview Questions](https://ehotinger.com/blog/technical-program-manager-example-interview-questions/)
- [System Design Guide: Scalable Job Schedulers & Cluster Management](https://ehotinger.com/blog/system-design-guide-scalable-job-schedulers-cluster-management/)
