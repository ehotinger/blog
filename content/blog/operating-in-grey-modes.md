---
title: "Operating in Grey Modes"
date: 2023-01-19T13:26:55-08:00
draft: false

tags:
- development
- software

categories:
- development
- software

slug: operating-in-grey-modes
---

## Grey Modes

In complex distributed systems, hardware failure is inevitable. The ability to operate in a grey mode (a mode in which a system is partially working) is an important and deliberate architectural choice to consider. Ask yourself the following question: would customers be more upset to have a completely nonfunctional system, or have a subset of the functionality working? For example, if you are working on a storage layer, perhaps it would be better to serve reads even though you can't serve writes at the same time.

A common way services operate in a grey mode is by allowing themselves to run despite metrics and logs failing. For example, say your logs or metrics are published to an external service and that external service is unavailable. The service will naturally start building backpressure from the generation of the metrics and logs, and you have to make a deliberate choice for the system's health. Otherwise, you could risk the system running out of memory or disk space. Most systems would rather lose metrics or logs than prevent customers from using the service in this case.

Do not let your system go down if you can prevent it by accepting loss of functionality like logs and metrics.

## Circular Buffers, Logging, and Docker

Circular buffers (also known as ring buffers) are fixed size buffers (typically in-memory) that operate as a contiguous set of memory. When data is added, a head pointer advances and when data is removed, a tail pointer advances. When you reach the end of the buffer, the pointers wrap around and overwrite old data, ensuring that new data always has a place to be inserted. You can read more about this particular data structure [here on Wikipedia](https://en.wikipedia.org/wiki/Circular_buffer) which includes a visualization of the head & tail pointers. Circular buffers can be thought of as a fixed-sized FIFO queue with the added benefit of 

Circular buffers can be particularly useful for logging. When a logging event happens, it can be stored in the circular buffer and periodically flushed to disk or an external storage service. If the buffer fails to be flushed, then you can overwrite old logs in the buffer to keep the latest logs. This prevents instances of backpressure from overwhelming the system. Combined with an error counting mechanism, you can alarm if you notice the production of logs outpacing the flushing of logs.

Docker has a logging daemon implementation which will read STDOUT and STDERR of a container and convert logs into an in-memory ring buffer (see [code here](https://github.com/moby/moby/blob/master/daemon/logger/ring.go)). Those messages get sent to a log driver, such as the [AWS log driver](https://github.com/moby/moby/blob/master/daemon/logger/awslogs/cloudwatchlogs.go), which can then upload them to a service such as CloudWatch.

The default logging mode for Docker is blocking, which means that if the log driver cannot process logs to a service correctly, it does not allow for lossiness and can start blocking during logging events. You can take precautions against this by configuring the maximum size of the ring buffer and enable logs to drop in a lossy manner (i.e., the first record in the ring) in cases of significant backpressure.

More specifically, check out these parameters for Docker's log driver:

```
'mode': 'non-blocking'
'max-buffer-size': '16m'
```

## Cons

Operating in a grey mode can make your service more resilient and keep your customers happy. Some situations like logging and metrics may be no brainers for you to consider.

However, it can create additional complexity for your service depending on the functionality you're talking about. In certain scenarios, complete failure can be better than operating with mixed state. Moreover, sometimes it can be difficult to recover from that mixed state to a fully operational state. As with any pattern, make sure to weigh the pros/cons and make sure it makes sense for your architecture.

Happy building!