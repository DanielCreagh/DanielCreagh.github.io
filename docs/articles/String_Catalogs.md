# [Discover String Catalogs](https://developer.apple.com/videos/play/wwdc2023/10155/)

## Introduction
Strings cataloges will supercede `.strings` and `stringsdict` files

## Demo
Everything in 1 place
All string automatically extracted
- easy to add language
- variable placeholders 
- vary by device

Localizable String:
- Key (required) runtime
- Value (optional) will fall back to Key
- Comment (recommended)
- Table

We can change the default language

It's possible to create multiple string catalogs.

In SwiftUI any string is automatically considered localizable.
- `LocalizedStringResource`

Can be used in Interface Builder - Xcode scans them and adds them to the catalog
- alos InfoPlist

Default values can be added in code.

Xcode will also remove strings from the catalog unless there are already translations in which case it flags them as stale

### Manually Managed Strings
these will never be deleted automatically

## Edit
There are some nice flags that xcode wil add to the translated strings 
* STALE
* NEW
* NEEDS REVIEW
* green to go!

Built in support for string variation workflos e.g. pluralization in different languages
- subsitutions

Catalogs have capability to filter and search more elegantly

## Export
Sending to get translations.
menu `Product` - `Export Localizations`
a package format with all the localization content.
`.xliff` is an industry standard format for localizing.


## Build
We can change the language used in the scheme editor.
JSON files under the hood (good for GIT diffing)
Doesn't require minimum deployment

## Migrate
It's easy to migrate
catalogs can coexist with legacy strings
migration assistant

## Wrap-up