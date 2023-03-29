---
title: "Create DataShare EricShare"
date: 2023-03-28T06:12:11-07:00
draft: false

description: "Learn how to create data shares with Amazon Redshift using the step-by-step developer guide. Follow along to set up a data share for producers and consumers using a simple table, and discover the power of Redshift's data sharing capabilities. See how small gestures can affect more people than you ever imagine!"

tags:
- amazon
- redshift

categories:
- amazon
- redshift
---

# CREATE DATASHARE ericshare;

Several years ago, I was helping build Amazon Redshift's [Data Sharing](https://docs.aws.amazon.com/redshift/latest/dg/datashare-overview.html) feature. I had the fortune of being one of the first people in the world to ever call [CREATE DATASHARE](
https://docs.aws.amazon.com/redshift/latest/dg/r_CREATE_DATASHARE.html) and run queries across producers and consumers. 

Any time I work on a new feature, I always create a developer guide for setting up the complete environment. I use developer guides as my personal notes while I work on a project. It makes it easy for me to remember where I left off and sometimes they are useful for other people onboarding to the project.

Late in 2020, I wrote a developer guide on how to set up data shares for a Producer and a Consumer using a trivial table. It was something like this:

1. On the producer, run the following commands:

```
# Create the data share
create datashare ericshare;

# Share it to a namespace
grant usage on datashare ericshare to namespace 'example-namespace';

# Create a simple table and insert some data for the data share
create table t1 (a int);
insert into t1 (a) values (1),(2),(3);
alter datashare ericshare add schema public;
alter datashare ericshare add table public.t1;
```

2. On the consumer, run the following commands to create a queryable database from the share:

```
# Create a database
create database ericdb from datashare ericshare of namespace 'example-namespace';

# Run queries!
select * from ericdb.public.t1;
```

Within the same year, we launched [Data Sharing across accounts](https://aws.amazon.com/blogs/aws/cross-account-data-sharing-for-amazon-redshift/), [across regions](https://docs.aws.amazon.com/redshift/latest/dg/across-region.html), [AWS Data Exchange for Amazon Redshift](https://docs.aws.amazon.com/redshift/latest/dg/adx-datashare.html), and several other features. It's a tremendously powerful architecture for Redshift, so I do recommend you check them out. :)

Several years later, I was watching a developer do a demo for a new feature in this area and to my surprise, they were using a datashare named `ericshare` in the demo. At the end, I was joking around and asked why they are using a datashare named that?!

They responded back to me with, "oh, ericshares is very popular as a name, because it is in the developer guide." I was floored, and queried to see whether this was true. To my surprise, there were hundreds of `ericshare`s that were created by many people over several years of time because of this small little guide!

This experience was hilarious and humbling. It made me remember that sometimes, the little things we do can affect more people than we ever imagine. And sometimes, it's easy to think that small gestures like this go unnoticed. However, you can just as easily spur a chain reaction that affects hundreds, thousands, and even millions of people with subtle actions and words.
