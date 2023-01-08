---
title: "Availability Numbers Every Programmer Should Know"
date: 2023-01-08T07:22:14-08:00
draft: false

tags:
- availability
- interviews

categories:
- availability
- interviews

slug: availability-numbers-every-programmer-should-know
---

# Availability Numbers Every Programmer Should Know

Availability refers to the amount of continuous uptime of a service. This is measured in a percentage, where 100% means a service has zero downtime and 0% means the service is never operational.

A service level agreement (SLA) is a commitment from a provider to a customer. When SLAs are mentioned for availability, providers will be stating their commitment to the uptime of the system, after which you are usually entitled to some form of compensation. Most services aim to be 99% available or higher and large cloud providers set their SLAs at 99.9% or above. Providers often refer to the number of 9s in the overall percentage as the SLA. For example, an SLA of 99.99% is referred to as 4 9s of availability. Usually, periods of expected downtime (i.e., system upgrades) do not apply to an availability SLA, but it varies per service - be sure to read their documentation.

## High availability SLAs

High availability (HA) systems typically guarantee 99.99% or greater of availability. The easiest way to remember a 99.99% SLA (4 9s) is to remember that you have roughly 4 minutes of downtime each month. 4 9s, minutes of downtime per month is the mantra.

Once you have this memorized, you can quickly memorize all the other monthly availability numbers. For example in 99.9%, since you are less available, you gain a power of ten so simply shift the decimal to be 40 minutes rather than 4 minutes. For 99.999% you are more available so you go from 4 minutes to about 40 seconds. For 99.9999% you get about 4 seconds of monthly downtime.

Below is a brief table which lists the daily, weekly, monthly, and yearly acceptable downtime to meet a particular availability SLA.

## Roughly acceptable downtime to meet SLA (easier to remember)

| Availability SLA  | Daily         | Weekly        | Monthly        | Yearly           |
| ----------------- | ------------- | ------------  | -------------- | ---------------- |
| 95%               |  1h           | 8h            | 1d             | 18d              |
| 99%               |  15m          |   2h          | 7h             |  3d              |
| 99.9%             |   1m          |   10m         |   40m          |   9h             |
| 99.99%            |   10s         |   1m 0.48s    |   4m           |    50m           |
| 99.999%           |   1s          |   6s          |   40s          |   5m             |
| 99.9999%          |   0.1s        |   0.6s        |   4s           |   30s            |

## Exact acceptable downtime to meet SLA

| Availability SLA  | Daily         | Weekly        | Monthly        | Yearly           |
| ----------------- | ------------- | ------------  | -------------- | ---------------- |
| 95%               |  1h 12s       | 8h 24m        | 1d 12h 13m 27s | 18d 2h 41m 28s   |
| 99%               |  14m 24s      |   1h 40m 48s  | 7h 14m 41s     |  3d 14h 56m 18s  |
| 99.9%             |   1m 26s      |   10m 4.8s    |   43m 28s      |   8h 41m 38s     |
| 99.99%            |   8.6s        |   1m 0.48s    |   4m 21s       |    52m 9.8s      |
| 99.999%           |   0.86s       |   6s          |   26s          |   5m 13s         |
| 99.9999%          |   0.086s      |   0.6s        |   2.6s         |   31s            |

Thanks for reading this far. If you want to calculate other availability numbers that are not in this table, check out [https://uptime.is/](https://uptime.is/) for a calculator.
