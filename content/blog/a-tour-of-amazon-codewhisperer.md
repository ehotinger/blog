---
title: "A Tour of Amazon CodeWhisperer"
date: 2023-04-14T22:41:30-07:00
draft: false

description: "Looking for a powerful developer tool that can suggest entire functions, write documentation or logical blocks of code for you? Check out Amazon CodeWhisperer! With real-time code generation and a constant stream of suggestions, CodeWhisperer feels like the autocomplete applications you're used to on your phone, but for code. It works with a ton of different languages and IDEs and has built-in security scanning to help you find bad practices. Check it out now and see how it can simplify your coding process!"

tags:
- artificial intelligence
- generative ai
- reactive event streams
- aws
- code generation
- serverless computing
- amazon

categories:
- artificial intelligence
- generative ai
- code generation
- aws
- serverless computing
- amazon

---

# A Tour of Amazon CodeWhisperer

## Overview

On April 12th, [Amazon CodeWhisperer was announced as Globally Available](https://aws.amazon.com/codewhisperer/). CodeWhisperer is a developer tool that can write entire functions, documentation, or complex logical blocks of code for you. The best part of this tool is how fluid and responsive it is. Unlike many other developer tools and large language models (LLMs), there is a constant stream of suggestions at your fingertips as you're writing. It doesn't require specific prompts and back and forth as a developer -- it feels like the autocomplete applications you're used to on your phones, but for code.

## Features

1. Real time code generation. It can suggest entire functions, write documentation, or logical blocks of code. 
2. You can easily tab in-between different suggestions and autocomplete in your favorite IDE.
3. Has support for a ton of different languages & IDEs ([see the full list here](https://aws.amazon.com/codewhisperer/features/)).
4. Works extremely well with AWS applications, APIs, and CDK.
5. Has built-in security scanning for your code to find bad practices.
6. Can easily provide references to similarities in code and open source via an Open Code Reference Log for you to review.

## Pricing

There are two tiers of pricing:
1. Individual
2. Professional

The Individual Tier is completely free which is a huge deal for individual contributors like me. Normally, other applications charge you a monthly rate as a minimum. Check out the pricing page at: https://aws.amazon.com/codewhisperer/pricing/

## Getting Started Experience

1. Install the latest AWS ToolKit plugin your favorite IDE. For me, I used the [VSCode Marketplace](https://marketplace.visualstudio.com/items?itemName=AmazonWebServices.aws-toolkit-vscode) and [Jetbrains Marketplace](https://plugins.jetbrains.com/plugin/11349-aws-toolkit).
2. Open the AWS extension panel and click the start button under Developer Tools -> CodeWhisperer.
3. Follow the on-screen instructions and sign-in to AWS if it's your first time.
4. Start running Auto-Suggestions!

## Examples

These trivial examples really don't do this service justice, but it's impressive to see the breadth of languages it can deal with, and how it can get it right even with my poorly worded prompts.

### 1. Go with channels and Go routines

```go
// Write me a function that has a channel, sends a hello world message for my blog post, and then waits until it's sent.
package main
import (
	"fmt"
	"time"
)

func main() {	
	ch := make(chan string)
	go func() {
		ch <- "Hello World"
		fmt.Println("Sent")

	}()
	time.Sleep(time.Second)
	fmt.Println(<-ch)
}
```

I figured I should add some comments to my main function, so all I had to do was enter `//` a few times. Below are some of the comment suggestions from CodeWhisperer I received, all of which are spot on:

```go
// Main is a function that sends a message to a channel.
// It's a blocking function.
// The channel is a buffered channel.
// The channel is a channel that can hold 1 message.
func main() {	
	ch := make(chan string)
	go func() {
		ch <- "Hello World"
		fmt.Println("Sent")

	}()
	time.Sleep(time.Second)
	fmt.Println(<-ch)
}
```

### 2. Java with a factorial function

For a logical function test, all I provided was the following text:
```
// Write me a program which does a factorial compute of a number.
```

And I received back this nicely commented and correct function:
```java
// Example:
// Input: 5
// Output: 120
public class Factorial {
    public static void main(String[] args) {
        int number = 5;
        int factorial = 1;
        for (int i = 1; i <= number; i++) {
            factorial *= i;
        }
        System.out.println(factorial);
    }
}
```

### 3. C# Breadth-First Search (BFS) Algorithm

Prompt:
```
// I need to implement a breadth first search with a queue.
```

Answer:
```csharp
public class BreadthFirstSearch
{
    public void Search(Node node)
    {
        Queue<Node> queue = new Queue<Node>();
        queue.Enqueue(node);

        while (queue.Count > 0)
        {
            Node current = queue.Dequeue();
            Console.WriteLine(current.Value);

            foreach (var child in current.Children)
            {
                queue.Enqueue(child);
            }
        }
    }
}

public class Node
{
    public string Value { get; set; }
    public List<Node> Children { get; set; }
}
```

The AWS docs page has lots of other [examples here](https://docs.aws.amazon.com/codewhisperer/latest/userguide/whisper-code-examples.html).