# WWDC: Meet Swift Async Algorithms

# Async Sequence
recap 
- Sequence
- Iteration uses Swift concurrency
- Iteration can throw

# Async Sequence Algorithms

# Zip algorithm
- Combines values into tuples
- Iterates concurrently
- Rethrows failures

# Merge
- SImilar to Zip
- Instead of tuples
- Merges async sequences
- If any error, all are cancelled

# Time algorithms
## Clock, instant, duration

# Clock Protocol
- wake up
- "Now"
- `SuspendingClock` - when computer is asleep the clock pauses
* Useful for animations
- `ContinuousClock` - continues even when computer is asleep
* measure human time

# Debounce
- Awaits a "quiescence" period
- classic algo

> I wonder if there are any objc.io or pointfree.co videos on this stuff

# Chunks
- by count, by time, by content

> Is all this new or are the GCD equivalents? SDK
RX Swift can do most of these new functions
Combine also addresses quite a lot of the same stuff

# Collections initializers

# Many different algorithms
Good reason to use async sequences i.e. all the support which I assume are highly optimized



---
# Chat GPT Summary:
    - The Swift Async Algorithms package is a collection of algorithms designed to process values over time using AsyncSequence
    - AsyncSequence is a protocol that describes values produced asynchronously, similar to Sequence, but with two key differences: the next function is asynchronous and it can handle potential failures using Swift's throw effect
    - The Swift Async Algorithms package includes advanced algorithms and can interoperate with clocks to provide powerful functionality
    - The asynchronous Zip algorithm works like the Zip algorithm in the standard library, but concurrently iterates the input AsyncSequences and rethrows errors if a failure occurs
    - The Swift Async Algorithms package can be used to concurrently process multiple input AsyncSequences and combine them in different ways, such as through the Zip algorithm
    - The Swift Async Algorithms package can be used to handle incoming messages as an AsyncSequence using AsyncStream, which preserves order and turn callbacks into an AsyncSequence
    - The Swift Async Algorithms package can be used to filter and sort incoming messages using the Filter and Sorted algorithms
    - The Swift Async Algorithms package can be used to make HTTP requests and handle the response as an AsyncSequence using the Request algorithm