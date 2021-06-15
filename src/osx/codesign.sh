#!/bin/bash
sw_vers
cp target/client/x86_64-darwin/Zzv-view src/osx/zzv.app/Contents/MacOS/
cd src/osx
sed -e 's/CFBundleVersionPlaceHolder/'$GITHUB_RUN_NUMBER'/g' zzv.app/Contents/Info.plist > zzv.app/Contents/Temp.plist
mv zzv.app/Contents/Temp.plist zzv.app/Contents/Info.plist
codesign -s "$APP_CERT_NAME" -f --entitlements entitlement.plist zzv.app