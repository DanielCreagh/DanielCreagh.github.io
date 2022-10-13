# Embracing Algorithms
#### [WWDC2018 / 223](https://developer.apple.com/videos/play/wwdc2018/223/)

## How to remove things from an array
Iterate through and remove the item when you find it.
- This crashes when you get to the end.

Replace `for` loop with `while` loop
- will "hop" over if there are 2 items next to each other
- guard the incrememnt in an else block

We can go backwards and make this even more simple.

## Check out the documentation for `remove(at:)`
This indicates the Big O = O(_n_).

9:40