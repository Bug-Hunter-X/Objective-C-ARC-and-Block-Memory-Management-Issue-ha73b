# Objective-C ARC and Block Memory Management Issue

This repository demonstrates a potential bug in Objective-C related to memory management when using blocks with Automatic Reference Counting (ARC). The bug arises from improper handling of strong references within blocks, leading to dangling pointers and potential crashes.

## Bug Description
The `bug.m` file contains code that showcases the issue. A block captures a strong reference to an object. If that object is deallocated before the block is executed, accessing its members within the block results in a crash.

## Solution
The `bugSolution.m` file provides a solution to this problem by using weak references and ensuring the captured object still exists before accessing its members within the block.

## How to Reproduce
1. Clone this repository.
2. Open the project in Xcode.
3. Run the application. Observe the behavior of the buggy code and how the fix addresses the issue.

## Key Learnings
This example highlights the importance of careful memory management in Objective-C, especially when dealing with blocks and ARC.  Properly using weak references and checking for object existence before access prevents dangling pointers and enhances application stability.