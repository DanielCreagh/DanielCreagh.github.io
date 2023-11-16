# Systems Design Interview (More detailed notes)

## [Mobile Data Storage Options](https://github.com/weeebox/mobile-system-design#data-storage-options)
#### Key-Value Storage (UserDefaults/SharedPreferences/Property List):
Usually, baked by XML or binary files. Allows associating primitive data with string-based keys. Works best for simple, unstructured, non-sensitive data (settings, flags, etc).
##### pros:
- easy to use built-in API

##### cons:
- insecure (Android provides EncryptedSharedPreferences; 3rd party wrapper libraries available on iOS).
- not suitable for storing large data.
- no schema support nor ability to query data.
- no data migration support.
- poor performance.

#### Database/ORM (sqlite/Room/Core Data/Realm/etc):
Based on a relational database. Perfect for large amounts of structured data that needs complex querying logic.

##### pros:
- object-relational mapping support.
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
- Keep as little of the user's data as possible - don't collect things you won't need.
    - Avoid collecting device IDs (prefer one-time generated pseudo-anonymous IDs).
    - Anonymize collected data.

- Minimize the use of permissions
    - Be prepared for the user to deny permissions and respect the user's choice when they deny permission the second time.
    - Be prepared for the system to auto-reset permissions.
    - Be prepared for app hibernation of unused apps.
    - Delegate functionality to the 1st party apps (Camera, Photo Picker, File Manager, etc).

-  Assume that on-device storage is not secure (even while using KeyStore/KeyChain functionality).
-  Assume that the backend storage is also not secure - discussed possible end-to-end encryption mechanisms.
-  Assume that the target platform's (iOS/Android) Security & Privacy rules will change - make critical functionality controllable by remote "feature" flags.
-  User's perception of security is as important as the implemented security measures - make sure to discuss how you would educate your customers about data collection, storage, and transmission.

## Encryption on iOS
### Choose a Strong Encryption Algorithm:**
Select a well-established encryption algorithm such as AES (Advanced Encryption Standard). Apple provides CommonCrypto, a library that includes implementations of these algorithms, making it easier to integrate into iOS applications.

Here are some of the key algorithms provided by CommonCrypto:

#### Symmetric Encryption:
**AES (Advanced Encryption Standard):** CommonCrypto provides functions for both AES encryption and decryption.

#### Hash Functions:
**SHA-1 (Secure Hash Algorithm 1):** Although less secure than more modern hash functions, SHA-1 is still included.
**SHA-256, SHA-384, and SHA-512:** These are part of the SHA-2 family of hash functions, offering stronger security.

#### Message Authentication Codes (MAC):
**HMAC (Hash-based Message Authentication Code):** CommonCrypto supports HMAC for message authentication.

#### Public Key Cryptography:
**RSA (Rivest-Shamir-Adleman):** CommonCrypto provides functions for RSA encryption and decryption operations.

#### Key Derivation Functions:
**PBKDF2 (Password-Based Key Derivation Function 2):** CommonCrypto includes functions for deriving cryptographic keys from passwords using PBKDF2.

#### Digital Signatures:
**DSA (Digital Signature Algorithm):** CommonCrypto supports DSA for digital signatures.

It's important to note that the availability of cryptographic algorithms may vary depending on the iOS/macOS version and the specific version of the CommonCrypto framework. Additionally, Apple may introduce updates or changes to the framework over time. Therefore, it's advisable to consult the official Apple documentation for the most up-to-date information on the cryptographic algorithms provided by CommonCrypto.

### Use Apple's Keychain Services:
Leverage the iOS Keychain Services to securely store sensitive information such as encryption keys. The Keychain provides a secure container for passwords, encryption keys, and other confidential data.

#### Generate Strong Keys:
Use a strong key derivation function (KDF) to derive encryption keys from user passwords or other credentials. This enhances security by ensuring that even if the user's password is compromised, the derived key is difficult to reverse engineer.

#### Implement Data Segmentation:
Consider segmenting data and encrypting only the sensitive portions. This approach can be more efficient and practical, especially when dealing with large datasets.

#### Securely Manage Encryption Keys:
Implement secure key management practices. Keys should be securely generated, stored, and rotated as needed. Avoid hardcoding keys in the source code or storing them in insecure locations.

#### Secure the Transport Layer:
If the application communicates with a backend server, ensure that data transmission is encrypted using secure protocols such as HTTPS. This protects data during transit.

#### Implement Secure User Authentication:
Tie data encryption to user authentication. Only allow access to the encrypted data after the user has successfully authenticated, and ensure that the key used for encryption is derived from their credentials.

#### Regularly Update and Patch:
Stay updated with the latest security patches and updates from Apple. Security vulnerabilities are continually discovered and addressed, so keeping the development environment and libraries up to date is crucial.

Sunsetting old builds 

#### Conduct Security Audits and Testing:
Regularly perform security audits and testing, including penetration testing, to identify and rectify potential vulnerabilities. This proactive approach helps ensure that the encryption implementation remains robust over time.

#### Document the Encryption Process:
Provide clear and comprehensive documentation on the encryption process and key management procedures. This documentation is crucial for maintaining the security of the application and for the onboarding of new developers.

By following these practices, an iOS application can implement strong local data encryption, safeguarding user data against unauthorized access.

## Certificate Pinning
Certificate pinning is a security mechanism used to enhance the security of data transfer between apps and their backends by ensuring that the server's certificate is trusted and has not been compromised. It helps protect against man-in-the-middle (MitM) attacks, where an attacker intercepts and potentially modifies the communication between an app and its backend.

Here's how certificate pinning works and its relevance to securing data transfer:

### SSL/TLS Encryption:
When an app communicates with its backend over the internet, the data is often transmitted using SSL/TLS encryption. This encryption ensures that the data remains confidential and secure during transit.

### Server Authentication with Certificates:
SSL/TLS relies on digital certificates to authenticate the server to the client (the app). The server presents a certificate signed by a trusted Certificate Authority (CA), and the client verifies the certificate to ensure the server's identity.

### Vulnerability to MitM Attacks:
Despite the use of SSL/TLS, there is a risk of MitM attacks where an attacker could intercept the communication between the app and the server. If the attacker can present a fraudulent certificate that the app trusts, they can decrypt and manipulate the data.

### Certificate Pinning:
Certificate pinning involves associating a specific server's SSL/TLS certificate with the app. Instead of trusting any certificate signed by a CA, the app "pins" the public key or the entire certificate of the server it expects to communicate with.

### Types of Pinning:
#### Pin to Public Key:
In this approach, the app checks if the server's public key matches the expected key.
### Pin to Certificate:
The app checks if the entire server certificate matches the pre-defined certificate.

### Benefits of Certificate Pinning:
#### MitM Protection:
By pinning a certificate or public key, the app protects itself against MitM attacks because it won't accept any other certificate, even if signed by a trusted CA.
#### Reduced Dependency on CAs:
Certificate pinning reduces reliance on CAs and protects against the compromise of a CA, as the app only trusts a specific certificate or key.

### Challenges and Considerations:
#### Certificate Updates:
Regularly updating certificates may require app updates. This can be addressed by using a backup pin that allows for a smooth transition during certificate updates.
#### Maintenance Overhead:
Certificate pinning requires careful management, especially when dealing with server certificate changes.

In summary, certificate pinning is a crucial security measure for mobile apps to mitigate the risk of MitM attacks by ensuring that the app only communicates with the expected and trusted server. It adds an extra layer of validation beyond the traditional CA-based certificate verification in SSL/TLS.

## Certificates
In the context of secure data transfer between apps and their backends, a certificate refers to a digital certificate used in the context of SSL/TLS **(Secure Sockets Layer/Transport Layer Security)** protocols. These certificates play a crucial role in authenticating the identity of servers and establishing secure encrypted connections.

Here's a breakdown of the key components and functions of a digital certificate:

### Issuer and Subject:
A digital certificate is issued by a Certificate Authority (CA). The CA is a trusted third party responsible for verifying the identity of the certificate holder, known as the subject. The subject is typically the server or entity that the certificate represents.

### Public Key:
The certificate contains a public key, which is a cryptographic key used for encryption and public key authentication. This key is mathematically related to a corresponding private key held securely by the server.

### Digital Signature:
The certificate includes a digital signature created by the CA using its private key. This signature ensures the integrity of the certificate and verifies that it has not been tampered with since it was issued.

### Key Usage Information:
The certificate specifies the purposes for which the public key can be used, such as encryption, digital signatures, or both.

### Validity Period:
Certificates have a defined validity period during which they are considered trustworthy. This period is specified by the CA.

### Common Name (CN):
The Common Name field in the certificate identifies the entity to which the certificate is issued. In the context of web servers, the Common Name is typically the fully qualified domain name (FQDN) of the server.

### Certificate Chain:
In a certificate chain, the server's certificate may be part of a hierarchy, where the root CA certifies an intermediate CA, and the intermediate CA certifies the server's certificate. The entire chain is used to establish trust from the root CA down to the server's certificate.

### SSL/TLS Handshake:
During the SSL/TLS handshake, the server presents its digital certificate to the client (e.g., a mobile app). The client verifies the certificate's digital signature, checks its validity, and ensures it is issued by a trusted CA.

### Public Key Infrastructure (PKI):
The system of digital certificates, CAs, and other registration authorities form a Public Key Infrastructure (PKI). PKI is the foundation for secure communication on the internet.

In the context of secure data transfer, when an app connects to its backend server, the server's digital certificate is crucial for establishing a secure and authenticated communication channel. The app relies on the certificate to verify the server's identity and ensure that the data exchanged is encrypted and remains confidential during transit.

## Authentication Best Practices for iOS
Authentication is a critical aspect of iOS app development, ensuring that users can securely access and interact with your application. Here are some authentication best practices relevant to iOS app development, suitable for discussion in a Systems Design interview for Apple:

### Use Apple's Authentication Services:
Leverage Apple's built-in authentication services, such as Sign in with Apple. This service provides a secure and user-friendly way for users to sign in to your app using their Apple ID, and it prioritizes user privacy.

### Secure Password Storage:
When dealing with passwords, ensure secure storage using cryptographic techniques. Hash and salt passwords before storing them on the server to protect against data breaches.

### Biometric Authentication:
Implement biometric authentication (Touch ID or Face ID) where appropriate. This adds an extra layer of security and convenience for users.

### OAuth 2.0 and OpenID Connect: (Industry standard)
If your app integrates with third-party services, consider using OAuth 2.0 for authorization and OpenID Connect for authentication. These industry-standard protocols provide a secure way to handle user authentication and authorization.

### Secure Communication with Backend:
Use HTTPS to encrypt data transmitted between the app and the backend server. Ensure that SSL/TLS certificates are properly configured and up-to-date.

### Token-Based Authentication:
Implement token-based authentication for API requests. When a user successfully logs in, provide them with a token that is sent with each subsequent request to authenticate and authorize the user.

### Implement Session Management:
Manage user sessions securely. Implement mechanisms to handle session creation, expiration, and revocation. Consider using techniques like JSON Web Tokens (JWT) for session management.

### Rate Limiting and Brute Force Protection:
Implement rate limiting on authentication attempts to protect against brute force attacks. This limits the number of login attempts a user can make within a certain timeframe.

### Multi-Factor Authentication (MFA):
Consider offering multi-factor authentication options for users who want an extra layer of security. This could involve combining something the user knows (password) with something they have (e.g., a temporary code from an authenticator app).

### User Education on Security:
Provide clear guidance to users on creating strong passwords and the importance of keeping their login credentials secure. Educate users about the security features your app employs.

### Regular Security Audits:
Conduct regular security audits and vulnerability assessments to identify and address potential security risks in the authentication process.

### Secure Key Management:
Protect sensitive information such as encryption keys and API secrets. Avoid hardcoding these values in the app's source code, and use secure storage options such as the Keychain.

### Logging and Monitoring:
Implement comprehensive logging and monitoring to detect and respond to any suspicious or anomalous activities related to authentication.

During the interview, you can elaborate on these best practices, discussing how they contribute to the overall security of an iOS application, especially in the context of system design considerations.