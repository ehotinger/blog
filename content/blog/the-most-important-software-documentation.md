---
title: "The Most Important Software Documentation"
date: 2023-01-17T07:45:40-08:00
draft: false

tags:
- development
- software


categories:
- development
- software


slug: the-most-important-software-documentation
---

The most important documentation in software engineering is the rationale behind architectural decisions and critical components. This rationale is should be discussed and recorded in a document via design meetings. The design document should contain architectural options which list off pros/cons. The document should have an opinion on the preferred approach and tell the reader why it is the preferred approach.

Ideally, the design discussions are also recorded and any feedback is persisted into the architectural design document. As the system evolves, the original document should be kept up to date, especially if the originally preferred approaches deviate. Without this documentation, the same questions and design considerations will be made over and over again as the architecture evolves. In some cases, the same mistakes can even be repeated.

Simple code comments, especially for critical functionality or complex subroutines are important but hard to put an exact value on. In [Lean Architecture: for Agile Software Development (Coplien & Bjørnvig, 2010)](https://www.amazon.com/Lean-Architecture-Agile-Software-Development/dp/0470684208) the authors note that "completely comprehensive documentation is wasteful and often unused."

Agile methodologies tend to emphasize working, high-quality software rather than perfect documentation. Perfect documentation is expensive and a hassle to keep up to date. Once the size of the documentation balloons to a high word count, nobody will read it. Once documentation is unread, it serves no purpose, and becomes technical debt to maintain.

