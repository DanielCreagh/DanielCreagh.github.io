# Systems Design Interviews
## Purpose of a Systems Design Interview
1. Translate an ambiguous problem statement into concrete technical requirements
2. Craft an architecture and design that satisfies those requirements
3. Articulate and Defend your design decisions

Goal: Demonstrate your expertise, approach to problem solving and communication skills.

## Structure
- Introduction
- Clarifying Questions
- Diagramming
- Minor interruptions

__It's important to identify any potential time sinks in advance__

### talking points:
- Rationale
- Trade Offs
- Decisions
- Assumptions

__There's no harm in taking quick pauses as opportunities for questions etc.__

### A suggested framework
1. Understand the problem and establish design scope (5 mins)
Define the problem space

> functional, non-functional and out of scope
2. Propose high level design and get buy-in (20 mins)
3. Design Deep Dive (15 mins)
4. Wrap Up (5 mins) summarise the design, list tradeoffs

(Intro and wrap up roughly 5 minutes each)

## Initial Talking Points
- Features
- Existing pieces
- Non functional requirements
* Business objectives
* speed
* reliability
- Scalability
- Technical Constraints
- Important Numbers
- Use Cases
- Scoping
- estimate amount of data
* storage
* bandwidth
* user volume
* user behaviour
- offline mode?
- How big is the engineering team? competency, maturity
- Target Markets (global?)
* catering for emerging markets may require making the bundle size very small due to network bandwidth etc.


### Functional Requirements
Think about 3–5 features that would bring __the biggest value to the business.__

### Identify bottlenecks and Scalability
Room to support further growth
- is there a single point of failure?
- how can we improve robustness
- is the data valuable
- should we keep the data consistent 
- how secure should the data be
- do we support global service
- edge cases e.g. peak time, hot users
- how do we scale the system to support 10x users

## High Level Design - Providing the "signal"
The interviewer might be looking for the following signals:
- The candidate can present the "big picture" without overloading it with unnecessary implementation details.
- The candidate can identify the major building blocks of the system and how they communicate with each other.
- The candidate has app modularity in mind and is capable of thinking in the scope of the entire team and not limiting themselves as a single contributor (this might be more important for senior candidates).


## Trade Offs
- different types of API
* REST (representational state transfer) CRUD
* SOAP
* GraphQL (dynamic requests) 
* RPC (function call approach) good for action based API

### White Boarding Tools
- excalidraw
- draw.io
- Omnigraffle
- Whimsical
- [Google Jam Board](https://jamboard.google.com/?pli=1)
- [Google drawings](https://docs.google.com/drawings)

## Non Functional Requirements


# Mobile Specific System Design
>  If the interviewer asks server-side questions - let them know that you're most comfortable with the client-side and don't have hands-on experience with backend infrastructure. It's better to be honest than trying to fake your knowledge. If they still persist - let them know that everything you know comes from books, YouTube videos, and blog posts.


- offline mode required
- limited resources
- battery usage
- push notifications
- architecture choice
* Three Layer Architecture (UI, processing/logic, Data/model)
* Service layer architecture


## UI Acrchitecture
- disaplying a large amount of data
- how to pull the data from backend
- Pagination
- prefectching
- Caching
- SQL Lite

## App Specifics
- build navigation
- gestures
- present vs. push

## Product Sense
- vision of the UI and users needs

## Performance/Stability
- Metered data usage - cellular network traffic can be very expensive.
- Bandwidth usage - constant waking up of the cellular radio results in a faster battery drain.
- CPU usage - higher computational load results in a faster battery drain and device overheating.
- Memory Usage - higher memory usage increases the risk of the app being killed in the background.
- Startup Time - doing too much work at the app start creates a poor user experience.
- Crashers/ANRs - doing too much work on the main thread can lead to app shutdowns and UI-jank. App crashes is the leading factor of poor store ratings.


# Glossary


## Resources:
[How to Crack Any System Design Interview](https://www.youtube.com/watch?v=o-k7h2G3Gco)
[How to Answer System Design Interview Questions (Complete Guide)](https://www.youtube.com/watch?v=L9TfZdODuFQ)
https://www.youtube.com/watch?v=T9I4AGvUWDE
[iOS System Design Interviews: Introduction & Resources](https://www.youtube.com/watch?v=QQI-pu0ZKhc)
https://github.com/weeebox/mobile-system-design
[iOS System Design Interviews: Introduction & Resources](https://www.youtube.com/watch?v=QQI-pu0ZKhc)