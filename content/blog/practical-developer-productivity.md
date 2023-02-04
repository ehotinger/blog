---
title: "Practical Developer Productivity"
date: 2023-02-04T10:49:13-08:00
draft: false

tags:
- development
- productivity
- software

categories:
- development
- productivity
- software

---

# Practical Developer Productivity

Developer productivity has been studied extensively across the last few decades because developers are typically the most expensive piece of software development. Despite decades of research, nobody has cracked the case. Moreover, most teams struggle to come up with a metric or goal to even define what it means to capture "developer productivity."

Over the last few months, I've spent a significant amount of energy in the space of developer productivity for an organization of ~500 developers. I decided to spend some time today to reflect on the journey and also to compare some of the latest literature in the space to see if there are any correlations across the industry. I also wanted to capture some practical development experience for others.

## Perspectives

The definition of developer productivity wildly varies depending on perspective. Productivity is not just about individual performance, but about an overall team and product performance. Metrics like number of pull requests, code reviews, commits, and so forth can never be used in isolation to gauge the effectiveness or performance of an engineer. By extension, there is no *one metric* that can tell us how to measure developer productivity ([[1]](#citations) and [[3]](#citations)).

At Google, studies from [[4]](#citations) contradict many other past studies. For example, they observed that lack of documentation does not significantly affect perceived productivity whereas others have claimed this to be a bottleneck. This makes sense; each product, organization, and company will have different challenges, and thus each developer's perspective will change depending on the environment they are in.

It is also impossible to gauge developer productivity through system-level metrics. There are innate aspects of the job: culture, working hours, morale, burnout, and other mental health factors that affect productivity, job satisfaction, and well-being. In [[3]](#citations), authors argue that "performance is often best evaluated as outcomes instead
of output." This is intuitive, because you can have tremendous output in an organization and still have undesirable outcomes. They also recommend a framework for some metrics, called the "SPACE" framework:
1. **S**atisfaction and well-being: how fulfilled, happy, and healthy one is
2. **P**erformance: an outcome of a process
3. **A**ctivity: the count of actions or throughput
4. **C**ommunication and collaboration
5. **E**fficiency and flow: doing work with minimal delays or interruptions

You can apply the SPACE framework, or any other frameworks from the cited authors below and arrange all kinds of different perspectives and metrics for each, such as:

### Organizational
1. Retention rate of employees
2. Developer satisfaction
3. Perception of outcomes

### Product
1. Reduced defects
2. Functionally and theoretically stable systems
3. Secure
4. Robust
5. Reliable
6. Maintainable
7. Extensible
8. Frequency of deployments

### Project
1. Accurate requirements or specifications
2. Friendly user interfaces/tooling
3. Clear repeatable processes and mechanisms
4. Low uncertainties
5. Responsive to changes/demand
6. Traceable events
7. Reusable components for past and future components

### Developer
1. Ability to learn
2. Communication and collaboration
3. Adapatability to changes
4. Interesting domains or cross-functional skills
5. Efficiency and flow (i.e., ability to quickly make changes without breaking things)
6. Low ramp-up time
7. Satisfaction of tools
8. Randomization/task shuffling
9. Documentation
10. Meeting time

## Unit Tests and Technical Debt

In [[2]](#citations) authors observe that there is a linear relationship between testing and productivity, but not on the external quality of the system. End-to-end integration testing or system-level tests are cited as the most valuable tests in a system.

Technical debt is always interesting to discuss. In [[7]](#citations), authors cited that 23% of their working time is due to technical debt. This was mostly taken up by refactoring time and having to read additional source code or gather context for the task. If a system is sufficiently complex and has enough history, there is no doubt that a huge amount of time will be taken up in the development lifecycle gathering context. It's why I wrote [this article](https://ehotinger.com/blog/the-most-important-software-documentation/) claiming:
> The most important documentation in software engineering is the rationale behind architectural decisions and critical components.

On the other hand, I would say these results are completely dependent on the organization, product, and project you are measuring against and it should not be used as a strong observation in the general case.

## Reflecting & Practical Advice
So, how do I feel about developer productivity after working on it the last few months? Well, solving developer productivity in a generic sense is impossible and a myth. Much of it depends on your expectations and perspective which varies inexplicably depending on the environment. It's a much better use of our time to be practical, using some of the aforementioned frameworks to guide our investment and decision making. Here are a few examples of practical things that almost every company or organization can consider for example:

1. Identify high ROI or tedious tasks that are perceived as painful and automate them. Use ChatGPT, Support Bots, Documentation Bots, Code Review Bots, Operational Bots, Testing Bots, etc. See [[6]](#citations) for more examples of practical bots.
2. Set a high unit test coverage bar for all new projects from the beginning, and constantly increase coverage over time. This won't necessarily help with product quality, but it will improve developer productivity.
3. Create simple documentation that provides insight into critical decisions and components that is easy for developers to discover.
4. Keep an open and agile mind. Be willing to constantly reprioritize tasks when new high ROI projects are discovered or introduced.
5. Reduce build times, test times, and deployment times.
6. Keep all your dependencies up to date by merging constantly (avoid security vulnerabilities or year-long conflicts by doing this incrementally). It will force your testing and infrastructure to stay up to date.
7. Empower sub-teams to develop and deploy their own software in an isolated environment. This can be done through macroservices or microservices.
8. Create best practices across the organization and evangelize them. This could vary from code quality, standards, etc. Keep on the lookout for common optimization tricks that can be applied to multiple projects.
9. Profile everything all the time. Catch trivial low-hanging bugs and regressions.
10. Treat preproduction environments like production environments. Put alarms, dashboards, and metrics on them. Create SLAs for them and do not let them break.
11. If tests don't have value, deprecate them and 
12. Aim to have one path of code. Anytime you introduce cyclical complexity,
13. Improve quality by introducing more end-to-end testing, canaries, and game day processes.
14. Invest in oncall and operator tooling.

## Citations
- [1] [Fleming W, Romas M, Dean B, and Rob L, "A Framework for the Effective Adoption of Software Development Methodologies"](https://dl.acm.org/doi/10.1145/1185448.1185493)
- [2] [Davide F, Burak T, and Markku O, "On the Effects of Programming and Testing Skills on External Quality and Productivity in a Test-Driven Development Context"](https://dl.acm.org/doi/10.1145/2745802.2745826)
- [3] [Nicole F, Margaret-Anne S, Chandra M, Thomas Z, Brian H, and Jenna B, "The SPACE of developer productivity"](https://dl.acm.org/doi/10.1145/3453928)
- [4] [Lan C, Emerson M, Mark C, Ciera J, Collin G, Andrea K, Nan Z, and Elizabeth K, "What improves developer productivity at google? code quality"](https://dl.acm.org/doi/10.1145/3540250.3558940)
- [5] [Thomas Z, "Measuring Developer Productivity and the New Future of Work"](https://dl.acm.org/doi/10.1145/3511430.3511914)
- [6] [Margaret-Anne S and Alexey Z, "Disrupting developer productivity one bot at a time"](https://dl.acm.org/doi/10.1145/2950290.2983989)
- [7] [Terese B, Antonio M, and Jan B, "Technical debt cripples software developer productivity: a longitudinal study on developers' daily software development work"](https://dl.acm.org/doi/10.1145/3194164.3194178)
- [8] [Michaela G, Margaret-Anne S, and Abi N, "An Actionable Framework for Understanding and Improving Developer Experience"](http://paper.getdx.com/)