# [So you think you know GIT](https://www.youtube.com/watch?v=aolI_Rz0ZqY)
GitHub Cofounder, so heavy weight. ProGit Author (this was my introduction to GIT)
I tried GitButler but it didn't seem  to be offering anything that made it worth the extra complexity.

## How Well Do You Know Git?
- 145 total commands 
###  82 Porcelain commands
- 44 main commands (add, commit, push pull... )
- 11 Manipulator (config, reflog, replace... )
- 17 interrogators (Blame, fsck, rerere... )
- 10 interactors(send-email, p4, svn... )

### Plumbing (not going into the details of these)
- 19 manipulators (aply, commit-tree, update-ref, ..)
- 21 interrogators (cat-file, for-each-ref, ..)
- 5 syncing (fetch-pack, send-pack, ..)
- 18 internal (check-attr, sh-i18n ...)

## Our Agenda
- refresher
- config stuff
- oldies but goodies
- some new stuff
- big repo stuff
- GitHub stuff

## Some Helpful Config Stuff
### alias
you can run other scripts from git alias commands
(use bang)

### [indludeIf]
have different git configs in different dirs
e.g. different ID/email etc.

## Oldies But Goodies
### `git blame -L`
### `git log -L :File:path/to/file`
(A little)

### `git blame -w` (ignore white space)
### `git blame -C` (ignore moves)
### `git blame -C -C` & `git blame -C -C -C` 
ignore commits and everything with file movement
### `git log -S 'regex'-p`
### `git reflog`
### `git diff -worddiff`
### rerere
REuse, REcorded, REsolution
- keeps merge conflicts

## Some New Stuff (You May Not Have Noticed)
### `git branch --column`
list branches in columns rather than a single list

### `git push --force-with-lease`
fetches first to avoid erasing other people changes on remote
(this is something we should encourage the team to use)

### Signing commits with ssh
use gpg or ssh
you can also sign your push `git push --signed`

### `git maintenance start`
- will automatically do garbage collection and pruning

## Some Big Repo Stuff / Monorepo Stuff
- prefetching

### filesystem monitor
### partial cloning
- filter out trees or blobs

### sparse-checkout
checkout particular directories

## Some New Github Stuff
- merge vs. rebase (merge!)
- squash merging
- automerge
- merge queue 
(lots of arguments against BitBucket)
- require linear history

## GitButler
- virtual branches

## Q: Why does GitHub not do git range diff?
- try to avoid feature creep and target assumed most common workflows

## Q: Why do submodules suck everywhere?
A lot of people moving to mono-repo
Not optimized, too few people using them

## Q: With SSH signing, is it possible to specify more than one key?
yes.

## Q: Why can't --force-with-lease be the default force?
backwards compatibility

## Q: If you were back on the Git development team, what direction would you like to see it move in?
- to work on more than 1 branch (git butler does this)
- save everything

## Q: We all love the Git CLI - but do you ever use any visual tools?
- git buttler
- visual studio
