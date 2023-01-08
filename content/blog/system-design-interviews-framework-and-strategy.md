---
title: "System Design Interviews: Framework and Strategy"
date: 2023-01-08T09:22:14-08:00
draft: false

tags:
- interviews
- distributed systems

categories:
- interviews
- distributed systems

slug: system-design-interviews-framework-and-strategy
---

# System Design Interviews: Framework and Strategy

System design interviews are often the most difficult technical interviews and can be daunting to tackle. They require a candidate to gather requirements, deal with ambiguity, communicate, and optimize their solution using all of their computer science knowledge. To make matters worse, these interviews are open-ended with hundreds of potential variations to achieve the desired end state of a system. How could anyone expect someone to design such a complex system in only an hour of time?

Well, the good news is that nobody will expect you to completely design the entire system in only an hour of time. After all, at our jobs it often takes us weeks or even months of time to design complex distributed systems!

The goal of this post is to provide you with a reliable strategy and framework for your system design interviews. The content is written and intended for interviewees. However, interviewers will find some aspects equally valuable.

At the end, I also provide a rough calibration guide to be used in any system design interview so that you can evaluate your performance and others' performance with mock practice once you understand the framework and strategies.

## The Framework

Every system design interview can be broken into four high-level steps:

1. Outline use cases and constraints of the system. Define the product specification.
2. Create a high-level design and get sign off on the direction.
3. Design core components in detail.
4. Scale the design, make it fully operational, and wrap up the interview.

**Important:** After the first step and for each subsequent step, kindly ask your interviewer if it is okay to move on to the next step or if they feel there is anything else important to discuss first. Between each step, they should tell you whether they want to continue discussion on a particular topic. For example, if you missed any key requirements or particular component in a high-level design, they should tell you that they want to discuss them in some detail first before you proceed. This will help you manage their expectations and ensure that you work on the components that the interviewer feels are important to discuss. It's also easy to talk about a topic for too long or for not long enough, so this will help you spend the right amount of time on each topic.

## 1. Outline use cases and constraints of the system. Define the product specification.

In this step, your goal is to ask questions to remove any ambiguity in the problem statement and define the requirements of the system. You should come up with a specification for the user requirements, a data model which represents the data of the system, and perform some basic back-of-the-envelope calculations to understand the scale of the system.

### 1.1 - Product Specification

This section will vary drastically depending on the problem, but you should aim to walk away with a very clear product specification by the time you're done. Work top down from the user experience down to the lower-level systems and start forming a high-level design in your head, which we will draw in a later step.

1. Do we need to support a website or UI interface? What is the first point that a user interacts with the system?
2. Likely we will need some form of authentication or API for our service so that customers can interact with the system. What are the APIs or user-facing functionality do we need to support in the system?
3. What are the main functionalities we want to support in the system? For example, if we're building a job scheduler, we certainly need a scheduler component. How should users specify that schedule; should we give them a CRON format, or something friendlier to read and write?

#### 1.1.1 - Users

1. What kind of users do we need to support for our system? Are they internal only, or is it an external offering?
2. How many users are in our system?
3. How many daily active users are there (DAU). By month, or year?
4. Is there anything noteworthy about particular users that we should account for, or should we design under the assumption of an average user? I.e., some users may have a way higher demand or usage than others.

#### 1.1.2 - Service Level Agreements (SLAs) and Operations
1. What is the availability of the system we're targeting for? Assume 99.9% as a baseline. See my [availability post](https://ehotinger.com/blog/availability-numbers-every-programmer-should-know/) for number calculations.
2. What are the performance/latency SLAs of our APIs (response times in milliseconds), or other critical components of the system?
3. What are the key performance indicators (KPIs) of our system? What metrics do our users care the most about (i.e., latency of a particular API may need to be much lower than others).

### 1.2 - Data Models
1. What are the various data models we need in the system? Think of how you will represent them in a relational database, NoSQL store, or other storage mechanism, and how users will access those data models from the corresponding storage.
2. Is there a maximum time limit we need to store the data for?
3. Is it acceptable for older data to be marked as "cold," and more recent data as "hot?" This enables us to move data around for an archival system.

### 1.3 - Storage and Consistency
1. Is data loss acceptable?
2. Is it required to be transactionally consistent, or can we accept some latency and eventual consistency in the system?
3. Can we send or process things more than one time, or does it have to be exactly once? I.e., for events do we have to guarantee that an event is only sent once?

### 1.4 - Back-of-the-envelope Math and Scale
1. How many users, jobs, and any other artifact in our data model do we need to support?
2. What is the peak load, average load, and minimum load of our service?
3. How many requests per second do we need to serve?
4. Do we need to consider seasonal elements of the system? I.e., during one period of the year the scale is 100x larger like a holiday?
5. How much storage do we need for our system?
6. How many nodes in our fleet will need?
7. How much storage do we need?
8. Do we need to partition our storage or app fleets to account for this scale?
9. Do we need to separate write/read paths or other core service paths into different subsystems as a result?

### 1.5 - Tips
1. For back-of-the-envelope calculations, always round up. For example, if you are told that you take 89 requests per second, just use 100 to make the math easier. Always use powers of tens because it's easy to multiply.
2. As you're going along asking these questions, write down the specification and response from the interviewer so that you can come back to if needed later.
3. Label your units (i.e., milliseconds, seconds, kilobytes, megabytes, etc.) so that they're clear to the interviewer.
4. Write down any assumptions you have about the system as you go along, and make sure your interviewer is on the same page for those assumptions. If they aren't, ask them how you should think about it differently.

## 2. Create a high-level design and get sign off on the direction.

At this point, you know all the requirements of the system and have built a rough model in your head for how to represent all the data flowing through the system. Once your interviewer confirms you're not missing any important requirements of the system and you feel there is no more ambiguity, it's time to write down the high-level diagrams of the system.

I typically recommend to begin drawing the design top-down starting with the user. For example, walk through how the first request and interaction of the system will look like for a customer. They will probably hit some API, the API will store some data, and then some other systems will start to operate off that data. Some of these layers are generic across any system, for example an API or authentication layer. Focus on the core architecture of the system and draw those boxes. As you're going along, draw lines between the various boxes to make it clear how the systems interact with one another.

### 2.1 - Tips
1. Keep in mind areas of extensibility as you go along, and proactively discuss them. These are what I refer to as commonly "bells and whistles." I.e., things that could make the system much easier to use or additional functionality that seems useful. For example, if you were building a scheduler a common one is prioritization of jobs. However, it's easy to get sidetracked on these bells and whistles and not even finish the core problem if you aren't careful! Start small and finish the core of the system and if you have extra time, talk more about those bells and whistles. These thoughts and suggestions will periodically pop up in your head throughout the interview. Speak about them and inquire whether you should expand on them to the interviewer. This is how you raise the bar - but make sure it doesn't eat away from your time. In general, try to avoid bells and whistles until you are at the end of the detailed design.
2. Nearly every system has a UI, CLI, API, and some form of user authentication (AuthN) and authorization (AuthZ). Talk about these and note that your system almost certainly needs them, but ask your interviewer if you should draw out the boxes and go into more depth. It's easy to get sidetracked on these components but they are not often the core problem.
3. Every system needs to be operationally steady. It likely needs some element of monitoring, alarms, dashboards, and logging. These are generic high-level boxes for any system. After you have designed the high-level core of the system, ask if you should draw all of these boxes, or wait to do them later upfront.

Before proceeding to design components in detail, make sure that you and the interviewer have agreed on the rough architectural direction of the system.

## 3. Design core components in detail.

It's time to go into more detail for each component. This could mean that you should speak about how a particular component would work in more detail, or even design an algorithm for a service. Start by asking your interviewer which components they want to spend more time or focus on in particular. Suggest areas you could speak about and ask which ones you should focus on first.

## 4. Scale the design, make it fully operational, and wrap up the interview.

You are nearly done with your interview! Similar to a coding interview, consider error cases and operational issues that may pop up during this time. Add on bells and whistles to the system. Talk about how you'll keep the system operating healthy, what the support structure would look like, metrics, dashboards, and logs that might be helpful for the team. Think about how to scale the system to the next level. An interview may ask follow-up questions during this time too.

Here are some example questions and talking points:

1. How do you scale the system to a magnitude higher?
2. How do you reduce the latency of certain components or features by a magnitude?
3. Discuss sharding and partitioning implementations in more detail. Speak about how subsystems will operate on partitions of data sets.
4. Add in caching layers.
5. If applicable, add in content delivery networks (CDNs)
6. Ensure your storage layers are optimized. For example, are you using a proper object store if it makes sense for images or videos?

## 5. Time Management

Time management is one of the trickiest components of system design interviews. Some questions will be extremely vague and require you to gather a lot of requirements, whereas other systems may have most of the requirements given to you upfront. Some interviewers may want to spend more time designing a particular component whereas others may want to spend more time on the high-level architecture. 

How do you know how to spend your time? The answer is that you don't and that is why is it so important to collaborate closely with the interviewer so that you focus on the things they think are important. After all, they're the ones evaluating you, so you need to make sure you give them as many data points on the things they care about as possible. 

It's important that you spend the majority of the time focusing on the major pieces of the problem. Avoid preemptively designing bells and whistles of the system until you have talked through the major design challenges and components first. If at any time you're unsure whether you should spend more time designing or talking about a component, or you aren't clear on what you think the interviewer wants to focus on next, simply ask the interviewer which component they want you to focus on next and if you've put in enough detail about an area.

In general, for a 45-minute system design interview, expect to spend roughly these time allocations on each step:

1. [5 - 10 minutes] Outline use cases and constraints of the system. Define the product specification.
2. [10 - 15 minutes] Create a high-level design and get sign off on the direction.
3. [10 - 20 minutes] Design core components in detail.
4. [5 - 10 minutes] Scale the design, make it fully operational, and wrap up the interview.

If you are ever unsure how long you will get for your system design interview, simply ask your recruiter how long you should expect to spend in the session, and how long you will get to talk about system design. Most interviews are 60 minutes so you will spend anywhere from 45-50 minutes on system design and 10-15 minutes on behavioral questions, team fit, and introductions. If the time allocation for a particular company is different, adjust your strategy ahead of time and practice it!

## 6. Calibration Guide

Below is a calibration guideline which applies to the majority of system design interviews. Fill in the brackets with a checkmark and ask yourself whether you accomplished all of them. If you didn't, try to correct it going forward.

- [] Removes ambiguity in the problem statement
- [] Drives the conversation
- [] Can articulate shortcomings and tradeoffs with different designs
- [] Translates requirements into user stories
- [] APIs cover requirements
- [] Sufficient HTTP knowledge/front end depth
- [] Infrastructure knowledge
- [] Familiarity with load balancers and fleets (no single points of failure)
- [] Familiarity with data layer
- [] The system is operational; logging/tracing/monitoring
- [] The system has proper data models
- [] The system can scale (i.e., sharding, partitioning, or other mechanisms)
- [] The system meets latency and availability requirements, or other SLAs
- [] The system meets all initial requirements for the product specification

## 7. Closing Thoughts and Final Tips

1. In your interview, pretend you are with another coworker working to design a system together on a whiteboard. System design interviews are meant to be a collaborative process with plenty of back and forth between the interviewee and the interviewer.
2. System design interviews are deliberately vague and open-ended to see how you tackle ambiguity. The best way to get rid of this ambiguity is by speaking and collaborating.
3. It's impossible to cover everything in a system design interview. Don't feel bad about not covering everything. Be deliberate with what you choose to speak about.
4. Research the company, teams, and interviewers that you're interviewing with. Most teams will ask system design questions which are similar to what the team actually works on to see if you'd be able to easily adapt to the team. If the company has an engineering blog, read their posts. Understand the product that the team you are interviewing with is building and think about how you would design that product from scratch. Do research.
5. For Senior, Staff, and Principal level positions, the main way to stand out is by going in-depth in particular topics. You'll likely want to spend more time here and you should aim to finish all requirement gathering and the high-level design much faster than other individuals.

Thanks for reading this far. Be sure to check out my similar post on [Coding Interviews](https://ehotinger.com/blog/coding-interviews-framework-and-strategy/) too. Best of luck in your interviews!