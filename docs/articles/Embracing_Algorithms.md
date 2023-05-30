# Embracing Algorithms
#### [WWDC2018 / 223](https://developer.apple.com/videos/play/wwdc2018/223/)

## How to remove things from an array
Iterate through and remove the item when you find it.
- This crashes when you get to the end.

Replace `for` loop with `while` loop
- will "hop" over if there are 2 items next to each other
- guard the incrememnt in an else block

We can go backwards and make this even more simple.

> weird hipster jokes

## Check out the documentation for `remove(at:)`
This indicates the Big O = O(_n_).

# Scalability is Predictability
?? doesn't really explain this but kind of follow it

# Algorithms
It might not look like it but even well architected code is full of algorithms

Crusty's advice was to use some SDK commands for optimised algorithms.

Scalability vs. Absolute Performance

`removeAll` => `halfStablePartition`
double pointer algo

# Get To Know Your Standard Library

everytime you write a loop, replace it with a call to an algorithm

> Array Slices don't start with index 0!

`indexBeforeFirst`

# Semantics
Also the importance of documentation
- rotate algo

# Discover Generic Algorithms
> Programming reveals the real.

# No Raw Loops!

---

for x in y {

}

.forEach

for var x in 0..<200 {

}

do while

1 2 3 4 5 6 7

x % 2 == 0

2 4 6 1 3 5 7

2 4 6 5 7 1 3