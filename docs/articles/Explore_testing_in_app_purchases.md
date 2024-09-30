# [Explore testing in-app purchases](https://developer.apple.com/videos/play/wwdc2023/10142/)

3 tools at different layers
- StoreKit Testing in Xcode
- App Store Sandbox
- TestFlight

# StoreKit Testing in Xcode
- No need to setup products on appstore/server
- Everything local in StoreKitConfig file
- Can use simulator
- Can then be sync'd
- capability to test advanced features like campaigns and trials etc.
- can configure time
- can also simulate errors
- transactions manager - allows you to test on multiple devices

# AppStore sandbox
- allows testing on both client and server
- dev account need paid application agreement
- need a Sandbox Apple ID (in appstore connect)
- requires device
- can distribute either from xcode

## Biling Problem message
can be simulated
- billingIssue

## Billing Grace Period
While Apple is collecting payment, user can have full access as if they'd already paid
- set duration in sandbox

## Family Sharing
- you can restrict family member access from device

## App Store Configurations
- should be able to make chages rom device

# TestFlight
End To End testing
- internal and external testers
- automatic updates
- You won't be charged for purhcases made through TestFlight builds
