# Merge vs. Rebase from a Team Policy point of view
The perenial debate across many Software Engineering teams from across the land.

The first thing to understand about `git rebase` is that it solves the same problem as `git merge`. Both of these commands are designed to integrate changes from one branch into another branch—they just do it in very different ways.

Rebasing is simply taking changes that have been made somewhere else, incorporating them into your branch, and then replaying all of your changes on top of that new base.

But should you adopt a rebase policy where the repository history is kept flat and clean? Or a merge policy, which gives you traceability at the expense of readability and clarity?

## Rebasing results in less noise in commit message
It also makes branch visualisation in GUI git clients easier to follow.  Clean, clear commit messages are as much part of the documentation of your code base as code comments, comments on your issue tracker etc.

But are merge commits really that much of a problem? Rebasing is re-writing history, which IMO breaks the purpose of having commits in chronoligcal order.

## Rebasing results in a linear history
Merging maintains the reality that the code has forked at some point and has then been reattached in the form of a merge commit. Rebase re-writes the history to result in the commit history not diverging at any point--contrary to the real history.

## Scripts in your workflow
Whatever the team decides it's important to create a policy as you may want to write scripts that come off the back of the commit messages, or even the number of commits themselves.

## Interactive Rebasing 
Interactive rebasing gives you the opportunity to alter commits as they are moved to the new branch. This is even more powerful than an automated rebase since it offers complete control over the branch’s commit history. This is typically used to clean up a messy history before merging a feature branch into main.

```
git checkout feature
git rebase -i main
```

This will open a text editor listing all of the commits that are about to be moved:

```
pick 33d5b7a Message for commit #1
pick 9480b3d Message for commit #2
pick 5c67e61 Message for commit #3
```

This is what the resultant history will look like, it can also be edited!

## The Golden Rule of Rebasing 
Never do it on public branches. 

A good execution of this is rebasing on your feature branch until you've created a PR. Once you've created your PR only ever do merges.


## Force Push
```
git push --force
```
This will over-write the remote branch with your local history.  Avoid doing this for the same reasons we don't rebase on public branches.


## `git pull`
By default, the `git pull` command performs a merge, but you can force it to integrate the remote branch with a rebase by passing it the --rebase option. 
```
git pull --rebase origin branch-name
```

## Squashing PR commits
If working in a large team with high velocity, you may want to squash all the commits in a single PR into a single commit. This will help keep the commit history tidier. You do lose some context with this though.

# Conclusion
The decision very much depends on the team size, sentiment and velocity. If you really want clean commit history (clean as in no merge commits) and your team is small and slow enough then rebase can make sense, otherwise merge and deal with the noise.









