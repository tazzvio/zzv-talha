cp target/client/x86_64-windows/Zzv-view.exe src/win/pkg
cd src/win
& 'C:\Program Files (x86)\Windows Kits\10\bin\10.0.19041.0\x64\makeappx.exe' pack /d ./pkg /p ./Package.appx