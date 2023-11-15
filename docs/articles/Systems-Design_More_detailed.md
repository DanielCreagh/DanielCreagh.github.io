# Systems Design Interview (More detailed notes)

## [Mobile Data Storage Options](https://github.com/weeebox/mobile-system-design#data-storage-options)
#### Key-Value Storage (UserDefaults/SharedPreferences/Property List):
Usually, baked by XML or binary files. Allows associating primitive data with string-based keys. Works best for simple, unstructured, non-sensitive data (settings, flags, etc).
##### pros:
- easy to use built-in API.
##### cons:
- insecure (Android provides EncryptedSharedPreferences; 3rd party wrapper libraries available on iOS).
- not suitable for storing large data.
- no schema support nor ability to query data.
- no data migration support.
- poor performance.
#### Database/ORM (sqlite/Room/Core Data/Realm/etc):
Based on a relational database. Perfect for large amounts of structured data that needs complex querying logic.
##### pros:
- object–relational mapping support.
- schema and querying support.
- data migration support.
##### cons:
- more complex setup.
- insecure (wrapper libraries available on iOS/Android).
- bigger memory footprint.
#### Custom/Binary (DataStore/NSCoding/Codable/etc):
Handles storing and loading data on a low level. Works best when you need to customize the data storage pipeline.
##### pros:
- highly customizable.
- performant.
##### cons:
- no schema/migration support.
- lots of manual effort.
#### On-Device Secure Storage (Keystore/Key Chain):
Use OS-encrypted storage for creating/storing encryption keys and key-value data.
##### pros:
- secure (not 100% unless provided by the hardware).
##### cons:
- not optimized for storing anything but encryption keys.
- encryption/decryption performance overhead.
- no schema/migration support.

## [Privacy & Security](https://github.com/weeebox/mobile-system-design#privacy--security)
#### Keep as little of the user's data as possible - don't collect things you won't need.
- Avoid collecting device IDs (prefer one-time generated pseudo-anonymous IDs).
- Anonymize collected data.
#### Minimize the use of permissions
- Be prepared for the user to deny permissions and respect the user's choice when they deny permission the second time.
- Be prepared for the system to auto-reset permissions.
- Be prepared for app hibernation of unused apps.
- Delegate functionality to the 1st party apps (Camera, Photo Picker, File Manager, etc).
#### Assume that on-device storage is not secure (even while using KeyStore/KeyChain functionality).
#### Assume that the backend storage is also not secure - discussed possible end-to-end encryption mechanisms.
#### Assume that the target platform's (iOS/Android) Security & Privacy rules will change - make critical functionality controllable by remote "feature" flags.
#### User's perception of security is as important as the implemented security measures - make sure to discuss how you would educate your customers about data collection, storage, and transmission.