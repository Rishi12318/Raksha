# Raksha Sutra - Quick Start Guide

## 🚀 Running the App on Android

### Prerequisites Check
1. ✅ Node.js installed
2. ✅ Android Studio installed
3. ✅ Android SDK configured
4. ✅ Android device or emulator ready

### Step 1: Start Metro Bundler
Open a terminal in the RakshaSutra folder and run:

```bash
npm start
```

### Step 2: Run on Android
In a NEW terminal (keep Metro running), run:

```bash
npm run android
```

OR using React Native CLI:

```bash
npx react-native run-android
```

### Step 3: Build for Android (Development)
The app should automatically install on your connected device or emulator.

## 📱 App Features

### Home Screen
- Real-time GPS location display
- Large SOS emergency button
- Tracking status indicator
- Feature cards (GPS, Alerts, Bluetooth)

### Emergency SOS
1. Press the large red SOS button
2. Device vibrates with alert pattern
3. Dialog appears with options:
   - Cancel: Dismiss alert
   - Call Emergency: Dial 112 (emergency services)
4. Location is ready to be sent to contacts

### Settings Screen
- Toggle GPS tracking
- Enable/disable Bluetooth sync
- Configure auto-SOS detection
- Manage emergency contacts

## 🔧 Troubleshooting

### Metro Bundler Issues
```bash
# Clear cache and restart
npm start -- --reset-cache
```

### Build Errors
```bash
# Clean Android build
cd android
./gradlew clean
cd ..
npm run android
```

### Permission Issues
Go to Android Settings > Apps > Raksha Sutra > Permissions
Enable all required permissions manually.

## 📦 Building APK

### Debug APK
```bash
cd android
./gradlew assembleDebug
```

APK location: `android/app/build/outputs/apk/debug/app-debug.apk`

### Release APK (for distribution)
```bash
cd android
./gradlew assembleRelease
```

APK location: `android/app/build/outputs/apk/release/app-release.apk`

## 🛡️ Safety Features Configured

✅ Location tracking (GPS)
✅ SOS emergency button
✅ Emergency calling
✅ Vibration alerts
✅ Bluetooth connectivity (ready for smartwatch)
✅ Background location access
✅ Wake lock for emergency mode

## 📞 Emergency Contacts Setup

The app is configured to support:
- Direct emergency calling (112)
- SMS alerts to saved contacts
- Location sharing

## 🔐 Permissions Required

The app requests these Android permissions:
- ACCESS_FINE_LOCATION
- ACCESS_COARSE_LOCATION
- ACCESS_BACKGROUND_LOCATION
- BLUETOOTH & BLUETOOTH_CONNECT
- CALL_PHONE
- SEND_SMS
- VIBRATE
- WAKE_LOCK

All configured in AndroidManifest.xml

---

**For any issues, check the full README.md file**

Stay Safe! 🛡️
