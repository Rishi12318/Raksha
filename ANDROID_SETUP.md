# Android Studio Setup Guide for Raksha Sutra

## 🔧 Step-by-Step Installation

### Step 1: Install Android Studio

1. **Run the installer** you downloaded:
   ```
   C:\Users\rishi\Downloads\android-studio-2025.2.1.7-windows.exe
   ```

2. **During Installation, make sure to check:**
   - ✅ Android SDK
   - ✅ Android SDK Platform
   - ✅ Android Virtual Device (AVD)
   - ✅ Performance (Intel HAXM) - if available

3. **Click "Next" through the installation wizard**

### Step 2: Android Studio First Launch

1. **Open Android Studio** after installation
2. **Choose "Standard" installation** when prompted
3. **Wait for SDK components to download** (this may take 10-15 minutes)

### Step 3: Configure Android SDK

1. In Android Studio, go to:
   - `File` → `Settings` (or `Configure` → `Settings` from welcome screen)
   
2. Navigate to:
   - `Appearance & Behavior` → `System Settings` → `Android SDK`

3. **In SDK Platforms tab**, install:
   - ✅ Android 13 (Tiramisu) - API Level 33
   - ✅ Android 12 (S) - API Level 31
   - ✅ Android 11 (R) - API Level 30

4. **In SDK Tools tab**, install:
   - ✅ Android SDK Build-Tools
   - ✅ Android SDK Command-line Tools
   - ✅ Android SDK Platform-Tools
   - ✅ Android Emulator
   - ✅ Intel x86 Emulator Accelerator (HAXM installer)

5. **Click "Apply" and wait for downloads**

### Step 4: Set Up Environment Variables

**Important: Add these to your Windows Environment Variables**

1. Press `Windows Key + X` → `System` → `Advanced system settings` → `Environment Variables`

2. **Add ANDROID_HOME:**
   - Variable name: `ANDROID_HOME`
   - Variable value: `C:\Users\rishi\AppData\Local\Android\Sdk`
     (or wherever Android Studio installed the SDK)

3. **Edit Path variable**, add these entries:
   ```
   %ANDROID_HOME%\platform-tools
   %ANDROID_HOME%\tools
   %ANDROID_HOME%\tools\bin
   ```

4. **Click OK** to save

5. **Restart your terminal/VS Code** for changes to take effect

### Step 5: Create Android Virtual Device (Emulator)

1. In Android Studio, click **Device Manager** (phone icon on right side)

2. Click **"Create Device"**

3. **Select Hardware:**
   - Choose: **Pixel 5** or **Pixel 6**
   - Click "Next"

4. **Select System Image:**
   - Choose: **API Level 33 (Tiramisu)** with x86_64 ABI
   - Download if needed
   - Click "Next"

5. **Verify Configuration:**
   - Name: "Pixel_5_API_33" (or any name)
   - Click "Finish"

### Step 6: Test Installation

**Close and reopen your terminal/PowerShell, then run:**

```powershell
adb --version
```

You should see the adb version printed.

### Step 7: Run Raksha Sutra App

1. **Start the Android Emulator:**
   - Open Android Studio
   - Click Device Manager
   - Click ▶️ (Play) button next to your virtual device
   - Wait for emulator to boot up completely

2. **Open terminal in VS Code** and run:
   ```powershell
   cd C:\Users\rishi\OneDrive\Desktop\raksha\RakshaSutra
   npm run android
   ```

3. **The app should install and launch!** 🎉

---

## ⚡ Quick Commands After Setup

```powershell
# Start Metro bundler
npm start

# Run on Android (in another terminal)
npm run android

# Check what devices are connected
adb devices

# Clear Metro cache if needed
npm start -- --reset-cache
```

---

## 🐛 Troubleshooting

### "adb is not recognized"
- Make sure environment variables are set correctly
- Restart VS Code and terminal
- Check that `C:\Users\rishi\AppData\Local\Android\Sdk\platform-tools` exists

### Emulator won't start
- Enable virtualization in BIOS
- Install HAXM manually from: `C:\Users\rishi\AppData\Local\Android\Sdk\extras\intel\Hardware_Accelerated_Execution_Manager`

### Build fails with Gradle error
- Make sure JDK 17 is installed
- Set JAVA_HOME to JDK 17 location

---

**After completing these steps, your Raksha Sutra app will run! 🛡️**
