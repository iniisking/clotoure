# clotoure

An ecommerce clothing platform

### build app bundle

flutter build appbundle --target-platform android-arm,android-arm64,android-x64

### run generator - assets, fonts, localization of content

dart run build_runner build --delete-conflicting-outputs

### apple pay merchant keys for info plist

<key>NSAppleMerchantCapabilities</key>
<array>
<string>3DS</string>
<string>debit</string>
<string>credit</string>
</array>
<key>NSApplePaySupportedNetworks</key>
<array>
<string>visa</string>
<string>masterCard</string>
</array>
