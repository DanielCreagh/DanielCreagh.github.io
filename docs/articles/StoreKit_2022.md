# Store Kit (What's New)
[What's new in Store Kit Testing 2022](https://developer.apple.com/videos/play/wwdc2022/10039/)

## XCode 14 updates
- configure in appstore connect
- create and sync the configuration file locally 
* a one way operation, to resync you'll need a new config file
- sync'd files are read only, to change it needs to be done on AppstoreConnect
- switching between configuration files (ergo store environments) can be done in the scheme editor

** Testing can be done on a device **

### Transaction Inspector
- accessible from the debug bar in xcode (the bar immediately below the code)

## Advanced subscription cases
### Refund requests (iOS 15)
- `refundRequestSheet` <-- SwiftUI

### Offer codes
Edit in the subscription configuration file
- these can be observed in the Transaction Inspector

### price increases
- the transactions can be updated with the price increase
- this will send a message to the app (behind the scenes)
- iOS will present a sheet over the app requesting consent for the price increase
- approve and decline are accessible in the transaction inspector

### billing retry and grace period
- errors like expired credit card
- grace period is how long they can use the subscription with a pending error
- all this can be simulated in the Transaction Inspector

## Sandbox Testing
### Users and Access
- streamlined

### AppstoreConnect 
- enabling automation

### Billing Failure Simulation


# Other Links
## [Working with in-app purchases in StoreKit 2](https://wwdcbysundell.com/2021/working-with-in-app-purchases-in-storekit2/)
### StoreKit 2
`async await` capability and Configuration file
#### fetch products
Products have unique identifiers. These can possibly be managed by b/e(cloud). Client sends user details to cloud and cloud decides which products are available. Client then sends the product list to Apple through StoreKit and received details for purchasing
#### Purchase Product
When the user chooses to buy a `product`, we can simply call the purchase method in order to start the purchasing process
#### Listen for updates
Transactions can be in `pending` state, subscriptions can be cancelled from outside of the app too so being able to listen to the subscription status is important.
`Transaction.listener`
#### Giving users access to paid content
`Transaction.currentEntitlements`
#### Refunds
Now available in the app

## [Meet StoreKit 2](https://developer.apple.com/videos/play/wwdc2021/10114)
- Products
- Purchases
- Transaction Info
- Transaction History
- Subscription Status

### App Account Token
UUID 
Keep track of which account started a transaction.
Internal Identifier for an individual user.

### Transaction Info
Now in JSON format.

### Types of Product
- consumable
- nonConsumable
- autoRenewable

### Transaction Verification
Verified by StoreKit2.

### Using a `detach` task to listen for transaction updates
- don't forget to `finish()` your transactions

### Transaction History
- sync'd across devices and installs
- you can manually force a sync
- purchases made with StoreKit1 will also be visible

### Subscription Status
an array of status will be returned when querying subscriptions

### Revocation Date
Has this purchase been refunded?

### JWS for security
- Header
- Payload
- Signature
 
#### Payload validation
- Embed your app's bundle ID in the app
- Check that this value matches the payload

# [Manage in-app purchases on your server 2021](https://developer.apple.com/videos/play/wwdc2021/10174)

## Building your server
- Receive status change notifications
- Track status changes through APls
- Validate access anytime
- Manage subscription status
- Track refunds for in-app purchases

## Validate status with receipts
receipts
JWS
### JWS transaction info
```
  "transactionId": "1098836",
  "originalTransactionId": "1082212"
  "webOrderLineItemId": "654738567439",
  "bundleId": "co.oceanjournal"
  "productId": "co.oceanjournal.monthlySubscription",
  "subscriptionGroupIdentifier": "12345",
  "purchaseDate": 1623081600000,
  "originalPurchaseDate": 1623081600000,
  "expiresDate": 1625673600000,
  "quantity": 1,
  "type": "Auto-Renewable Subscription",
  "appAccountToken": "370a95b-4455-42e6-bac2-e59259c8aac2" ,
  "revocationDate": 1625155200000,
  "revocationReason": 0,
  "offerType": 2,
  "offerIdentifier": "co.oceanjournal.offer1"
```

## Check status with APIs
### Subscription Status
includes `originalTransactionId`

// status values
// 1 -- active
// 2 -- expired
// 3 -- billing retry
// 4 -- grace period
// 5 - revoked

### In-App Purchase History API
Paginated
`GET /inApps/v1/history/{originalTransactionId}`

private keys from AppStoreConnect.

## Track status with notifications
- App Store server notifications
* status change
* updates immediately

### Notification types
- DID_CHANGE_RENEWAL_STATUS
- DID_CHANGE_RENEWAL_PREF
- DID_FAIL_TO_RENEW
- DID_RECOVER
- DID_RENEW
- REFUND
- REVOKE
- SUBSCRIBED
- OFFER_REDEEMED
- EXPIRED
- GRACE_PERIOD_EXPIRED
- PRICE_INCREASE

### Outages
- InApp history API to the rescue

## Manage family sharing

## Test in sandbox
- Capability to separate sandbox and production notifcations.
- clear purchase history for tester (1 way door)

