# Raksha Sutra - Digital Protection Thread 🛡️

A Flutter mobile application for personal safety with Wear OS integration, featuring real-time location tracking, SOS emergency alerts, and smartwatch connectivity.

## Features

- 📍 **Real-time Location Tracking** - Continuous GPS monitoring and location sharing
- 🚨 **SOS Emergency Button** - Quick access to emergency services with location sharing
- ⌚ **Wear OS Integration** - Connect and communicate with Wear OS smartwatches
- 📱 **Smart Alerts** - Send location to emergency contacts automatically
- ⚙️ **Customizable Settings** - Configure safety preferences and emergency contacts
- 🔔 **Background Monitoring** - Continuous protection even when app is in background

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio with Android SDK
- Android device or emulator (API 26+)
- Wear OS device (optional, for watch features)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd "Raksha sutra"
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run code generation** (for Riverpod, Freezed, etc.)
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── core/
│   ├── router/          # Navigation and routing
│   ├── theme/           # App theming
│   └── wear_os/         # Wear OS service integration
├── features/
│   ├── home/            # Home screen and main features
│   ├── onboarding/      # Welcome and onboarding screens
│   └── settings/        # Settings and configuration
└── main.dart            # App entry point
```

## Key Technologies

- **Flutter** - Cross-platform mobile framework
- **Riverpod** - State management
- **GoRouter** - Navigation and routing
- **Geolocator** - Location services
- **Wear OS Data Layer** - Smartwatch communication
- **Hive** - Local data storage

## Android Configuration

The app requires the following permissions:
- Location (Fine & Coarse)
- Bluetooth
- SMS & Phone (for emergency contacts)
- Notifications

## Wear OS Integration

The app communicates with Wear OS devices using the Wearable Data Layer API. Features include:
- Bidirectional data sync
- Health data monitoring (heart rate, steps)
- SOS alerts from watch
- Battery level monitoring

## Development

### Running Tests
```bash
flutter test
```

### Building for Release
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License.

## Support

For issues and feature requests, please use the GitHub Issues page.

