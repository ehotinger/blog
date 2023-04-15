---
title: "A Tour of AWS Lambda Response Streaming"
date: 2023-04-11T21:27:56-07:00
draft: false

description: "Learn about AWS Lambda's new response streaming feature for faster web application responsiveness. Previously, Lambda-based apps had to fully generate and buffer responses before returning anything to clients. Response Streaming, supported on Node.js 14.x, 16.x, and 18.x, solves this problem by using reactive event streams, HTTP/1.1 Chunked Transfer Encoding, which significantly improves Time to First Byte and enables streaming of large payloads. Response Streaming is useful for real-time video and audio streams, larger payload applications, and serverless scenarios. Billing is based on function duration and streamed data amount. Check out the tutorial and example code."

tags:
- lambda
- response streaming
- reactive event streams
- aws
- serverless computing
- amazon

categories:
- lambda
- response streaming
- reactive event streams
- aws
- serverless computing
- amazon

---

# AWS Lambda Response Streaming

## Overview

In April 2023, AWS Lambda made an exciting announcement and released [response streaming](https://aws.amazon.com/about-aws/whats-new/2023/04/aws-lambda-response-payload-streaming/) which makes it one of the first function providers to offer streaming support in the world. Before, Lambda-based applications had to use a traditional request-response model which meant applications had to fully generate and buffer responses before returning anything to a client.

Response Streaming is a new invocation pattern:
1. There is an `InvokeWithResponseStream` API and a new handler signature for applications. 
2. You can also use a function URL with the `ResponeStream` invocation mode.

Under the hood, Lambda Response Streaming uses [HTTP/1.1 Chunked Transfer Encoding](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Transfer-Encoding) and reactive event streams. This significantly improves the responsiveness of applications and makes it possible to support much larger payloads.

## Problems Solved

Prior to Response Streaming, Lambda functions had to fully process a response before returning it to the client. This leads to a few problems:

1. Buffering and returning responses is a single operation, which can lead to a slow Time to First Byte for large payloads.
2. A lower payload limit of 6MiB, largely because you have to keep those responses in memory.

Time to First Byte is a measurement of responsiveness. It refers to the amount of time it takes for a client to receive the first byte of data from a server after making a request. In the context of Lambda, it determines how quickly the client receives the first byte of data back from the server. Because data can now be streamed, you can immediately send back data to the client as soon as it as available and create reactive applications.

## Sample Use Cases

1. Real-time video and audio streams.
2. Larger payload applications, i.e. APIs that serve PDFs, ZIPs, images, etc. Anything that can be chunked.
3. Serverless scenarios like partial rendering or websites.

## Billing & Pricing

Response Streaming is billed based on the duration of the Lambda function and the amount of data streamed back to the client.

There's a new billing dimension for `BytesProcessed` which covers Data Transfer Out (DTO) prices based on EC2 rates. See the full pricing page at: https://aws.amazon.com/lambda/pricing/

## Runtimes Supported

In the initial release, Lambda supports response streaming only on Node.js 14.x, Node.js 16.x, and Node.js 18.x. Refer to https://docs.aws.amazon.com/lambda/latest/dg/configuration-response-streaming.html for the latest runtime support.

## Example Stream Code & Tutorial

- https://docs.aws.amazon.com/lambda/latest/dg/response-streaming-tutorial.html

## Failure Modes For Streams

When data starts streaming to the client, the HTTP status code will report as a 200. If the function encounters an error or times out before the stream is gracefully closed, then Lambda will close the stream and send an error event to the response event stream. You can add logic in your application to listen to those error events to handle failures gracefully or add retry logic.