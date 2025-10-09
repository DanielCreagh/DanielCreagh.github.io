# [Hidden engineering challenges of A/B Testing](https://www.youtube.com/watch?v=cTbTZ-uShr8)
## What  is A/B Testing
- experimental approach
- split userbase in to 2 groups
- each group sees a different variant of one feature

## Tools matured
Now it's an essential tool
- Optimizely
- Firebase

## Topics
- Code COmplexity
- Data Corruption
- Testing and Debugging Complexity
- Developer Experience
- User Satisfaction

## Code Complexity
- Cyclomatic Complexity
* Code Paths
- Enrolled (or not), with two paths means  -> Cyclomatic Complexity of 3, but this has flaws
- Control & Treatment variations

## Experiments need to be cleaned up afterwards
once data gathered and decision made, we need to remove the experiment code
This can get tricky when there are other influences like checking which version of iOS etc.

### Experiment induced damage

## Data Corruption
Experiments may safe data in a different format
Same with user generated content

## Testing of A/B Testing
- code coverage vs. path coverage

## Shared State can be non-obvious
indirect state sharing between features can cause invalid states

## Testing overhead
even following the tool providers best practices, the testing overhead is fairly hefty.

## Crash Logs lack A/B testing data
- breadcrumbs

## Customer Support & FAQs
A/B Testing makes these things more difficult

## Developer Experience
Teams can get carried away with A/B tests

- can have an impact on code review

## A/B testing is a lot easier on web
- lifecycle
- release cadence

## Most A/B Test experiments fail
- Watching your code get thrown away
- burnout
- code not surviving A/B Testing

## User Expreience
- no-one wants to be experimented on without consent

## A/B Testing tends to be short sighted
