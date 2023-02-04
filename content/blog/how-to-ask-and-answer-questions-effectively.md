---
title: "How to Ask and Answer Questions Effectively"
date: 2023-01-09T15:14:14-08:00
draft: false

tags:
- development
- leadership

categories:
- development
- leadership

---

A common question from junior engineers is: "how long should I wait before I ask for help?" The below post will offer guidance for junior engineers on when and how to ask effective questions. We'll also cover guidance to senior engineers on how to answer questions from junior engineers.

This post offers advice from both sides of the coin to help provide you the perspective of your fellow engineers. Remember: you were once a junior engineer and one day you will be the senior engineer!

## How to Ask Effective Questions

1. Do your own research before asking a question. Read wikis, online sites/forums, internal websites, documentation, etc. Anything you can get your hands on. See if the question has already been answered.
2. Isolate the problem. Try to identify the underlying root cause. Post the callstack or traces, identify the component or subsystem that is broken. Include the necessary details (callstacks, logs, code, etc.).
3. Check for common issues in your system, such as:
    1. Clean and re-sync your environment
    2. Test if it works locally vs in preprod environments
    3. Review recent changes that may have affected or caused the issue
    4. Check for configuration mismatches
4. Choose the right audience to ask your question to. I.e., public forums, mailing lists, Slack channels, tickets, etc. are all effective channels but which is the most effective for your use-case?
5. Try to avoid sending direct messages. Nobody else can see the question you're asking and nobody else can help you. You may overload that person and you have created a single point of failure. They may not respond to you in a timely manner.
6. Explain your use case. Sometimes there’s a better way to solve the problem. You may miss a better solution when you only fixate on debugging a specific use case.
7. Just ask the question! Don't beat around the bush by saying hello and waiting for a response. State your question clearly from the beginning. See also: [No Hello](https://www.nohello.com/).
8. Make your questions legible and easy to consume with concise formatting. Optimize for people; make them want to read your questions because they are concise and coherent.
9. Timebox yourself. Find balance on how long to wait before asking a question. It varies per team. Make it clear you’re blocked and unable to make progress depending on the criticality and turnaround expected of the task. If you feel like you aren't making progress, chances are you should ask a question. A few hours for serious issues, a day or so for smaller issues is a decent frame of reference.
10. Continue your research after you have asked the question. Don’t wait to be unblocked, continue to try and unblock yourself. Don’t get frustrated along the way.
11. Remember: nobody bites, and we don’t want to see you spin or get stuck.

## Once you have an answer

After you have an answer, ask yourself "How could I have done this on my own? How can I make it easier for others in the future?"

Focus on figuring out how to get there faster next time rather than knowing the answer to everything. Make it easier for yourself and others to find the answer in the future or completely eliminate the problem via code or documentation.

## How to Answer Questions Effectively

1. Great engineers will not just help solve the problem, but teach the engineer how to solve similar problems in the future on their own.
2. Don’t spoon feed, but don’t make people cautious in asking questions either.
3. If there are too many questions maintain a document and track them. Use this document to record decisions and past conversations which you can refer and send people back to later. This is particularly helpful if you find yourself duplicating answers, thoughts, or discussions.
4. Cultivate environments where people feel safe to ask “stupid” questions.
5. Lead with empathy.
6. Create mechanisms so that the question isn’t repeated in the future

## Bonus questions and dimensions to ask senior engineers

1. Consider features and components outside your scope of ownership to be as forward thinking as possible. Consider not just the future of that project but the future of the service as a whole.
2. Ask questions about the big picture and architecture; it helps you grow faster
3. For complicated designs/code flows, scheduling a meeting with leads is easier and saves time. Don’t abuse calls, where emails or async conversations are sufficient

## Closing

Be confident, don’t worry, and don’t give up. Everyone starts at the same point. You were once the person asking the senior engineer questions, and one day you will be the one answering all the questions.

Check out these other good blog posts on this topic:

- [Getting Answers (Mike Ash)](https://www.mikeash.com/getting_answers.html)
- [How to ask good questions (Julia Evans)](https://jvns.ca/blog/good-questions/)