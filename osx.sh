#!/bin/bash
cp target/client/x86_64-darwin/Zzv-view src/osx/zzv.app/Contents/MacOS/
cd src/osx
echo "$PRIV_KEY" > AuthKey_7QW2J46UP9.p8
base64 AuthKey_7QW2J46UP9.p8
codesign -s "$APP_CERT_NAME" -f --entitlements entitlement.plist zzv.app
xcrun productbuild --component zzv.app /Applications --sign "$INSTALLER_CERT_NAME" zzv.pkg
xcrun altool --upload-app --file zzv.pkg --type osx --apiKey "$APPSTORE_KEY_ID" --apiIssuer "$APPSTORE_ISSUER_ID"