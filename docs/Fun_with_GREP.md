# GREP
For when you don't have 100% confidence in MacOS Finder search feature.

## Find
Let's find all the files in the root directory (of our repository) which contain a string/reference to our previous beta version of xcode:
```
grep -r "{ xcode: 'Xcode14-beta' }" *
```

* `-r`: recursive search, perform the same search in each directory, and each directory within that and so on...
* `*`: wild card, in this position it means look at all files/directories in the current working directory `cwd`
* `-l`: some people suggest using this flag

the output might look something like this:
```
Scripts/CI/ui-test-pipeline.groovy:  { xcode: 'Xcode14-beta' }
Scripts/CI/unit-test-nightly-pipeline.groovy:  { xcode: 'Xcode14-beta' }
Scripts/CI/gnl-adhoc-build.groovy:  { xcode: 'Xcode14-beta' }
Scripts/CI/unit-test-pipeline.groovy:  { xcode: 'Xcode14-beta' }
Scripts/CI/gnl-release.groovy:  { xcode: 'Xcode14-beta' }
Scripts/CI/DeveloperTool.groovy:  { xcode: 'Xcode14-beta' }
Scripts/CI/Jenkinsfile:  { xcode: 'Xcode14-beta' }
```

# Replacing
GREP doesn't do find/replace, but [Google](https://Google.com)/[Stack Overflow](https://stackoverflow.com/) offer some nice one line solutions. What I ended up doing looks like this:

Set these variables to aboid escape character confusion (_I'm not 100% sure it's even possible without doing this_).
```
% oldstring="{ xcode: 'Xcode14-beta' }"
% newstring="{ xcode: 'Xcode14' }"
```

then this monster:

```
% grep -rl $oldstring * | xargs sed -i "s/$oldstring/$newstring/g"
```

using `GREP` to gather the filesn then using `SED` to do the replacements within that file. (I'm guessing GREP is more efficient at finding than `SED` and hence we don't just `SED` on all the files). Let's break it down:

* `grep -rl $oldstring *` this is our previous command (note we're using `-l` to just grab the filenames)
* `|` pipe: passing the file names into the following command `sed`
* `xargs`: "extended arguments" converts input (_standard input_) into arguments of a command
* `sed`: "stream editor" command, performs editting operations, line by line
* `-i`: edit files in-place instead of printing to standard output (`--in-place`)
* `s`: this is essentially saying this is a "find & replace"
* `/$oldstring/$newstring/`: this is self explanatory
* `g`: this is saying to apply the find and replace to *ALL* the found occurances

Once we've done this we run the initial command again:
```
grep -r "{ xcode: 'Xcode14-beta' }" *
```
... and we shouldn't get any results.
But if we change it slightly: 
```
grep -r "{ xcode: 'Xcode14' }" *
```
we should get the same set of files indicated:
```
```
Scripts/CI/ui-test-pipeline.groovy:  { xcode: 'Xcode14' }
Scripts/CI/unit-test-nightly-pipeline.groovy:  { xcode: 'Xcode14' }
Scripts/CI/gnl-adhoc-build.groovy:  { xcode: 'Xcode14' }
Scripts/CI/unit-test-pipeline.groovy:  { xcode: 'Xcode14' }
Scripts/CI/gnl-release.groovy:  { xcode: 'Xcode14' }
Scripts/CI/DeveloperTool.groovy:  { xcode: 'Xcode14' }
Scripts/CI/Jenkinsfile:  { xcode: 'Xcode14' }
```

Win.