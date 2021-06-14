#!/bin/bash
cp target/client/x86_64-darwin/Zzv-view src/osx/zzv.app/Contents/MacOS/
cd src/osx
mkdir -p private_keys
echo "$PRIV_KEY" > private_keys/AuthKey_7QW2J46UP9.p8
cat private_keys/AuthKey_7QW2J46UP9.p8
base64 private_keys/AuthKey_7QW2J46UP9.p8
codesign -s "$APP_CERT_NAME" -f --entitlements entitlement.plist zzv.app
xcrun productbuild --component zzv.app /Applications --sign "$INSTALLER_CERT_NAME" zzv.pkg
xcrun altool --upload-app --file zzv.pkg --type osx --apiKey "$APPSTORE_KEY_ID" --apiIssuer "$APPSTORE_ISSUER_ID"