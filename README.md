# Raksha Sutra - Women's Safety Companion App 🛡️💜

A comprehensive Flutter-based women's safety application featuring real-time emergency services, health tracking, AI companion, and mental wellness support. Built with a beautiful lavender-themed UI and smooth animations.

## 🌟 Overview

Raksha Sutra (Digital Protection Thread) is a holistic safety and wellness platform designed specifically for women. It combines emergency response systems, health monitoring, mental wellness support, and AI-powered safety guidance in one elegant mobile application.

---

## ✨ Core Features

### 🚨 Emergency Services
- **SOS Button** - Dual-click emergency system
  - Single click: Calls authorized person/emergency contact
  - Double click (within 2 seconds): Directly calls police (112)
  - Prominent black button on home screen
  
- **Emergency Service Categories**
  - **Domestic Violence** - Direct hotline access
  - **Harassment** - Quick reporting and support
  - **Medical Emergency** - Health emergency services
  - **Legal Aid** - Legal assistance and counseling
  - **Emergency Help Center** - Comprehensive support dropdown

### 💜 Mental Wellness - Positive Vibes
- **Daily Motivational Quotes** - 8 rotating inspirational messages
- **Animated Flower Display** - Beautiful rotating flower animation (Lottie/CustomPaint)
- **Interactive Dialog** - Click through quotes with "Next Quote" button
- **Quotes Collection:**
  - "You are stronger than you think! ⭐"
  - "Every day is a new beginning 🌅"
  - "Believe in yourself and magic happens ✨"
  - "You've got this! Keep going 💪"
  - "Your courage inspires others 🌟"
  - "Stay positive, stay strong 💖"
  - "You are valued and loved 🌸"
  - "Small steps lead to big changes 🦋"

### 🏥 Health Monitoring Dashboard
- **Real-time Health Metrics** (Slidable Cards)
  - **Heart Rate** - 72 bpm monitoring
  - **Steps Counter** - Daily step tracking (Goal: 10,000)
  - **Calories Burned** - 1,450 kcal tracking (Goal: 2,000)
  - **Sleep Quality** - 7h 23m monitoring with deep sleep tracking
  - **Period Tracker** - Menstrual cycle monitoring (28-day cycle)
    - Shows days until next period
    - Last period date tracking
    - Calendar icon with pink theme

- **Comprehensive Health Dashboard** (Modal)
  - Blood Pressure (120/80 mmHg)
  - Water Intake (6/8 glasses - 75% of goal)
  - All metrics with detailed subtitles and progress

### 🤖 Miss Lara AI - Safety Companion
- **AI Chat Interface** - 24/7 safety companion
- **Reading Animation** - 200x200px Lottie animation (reading.json)
- **Interactive Chat Dialog** - Safety tips and guidance
- **Pre-configured Messages:**
  - Welcome and introduction
  - Safety tips provision
  - Emergency guidance
  - 24/7 availability assurance
- **Features:**
  - Purple gradient avatar (Icons.psychology)
  - Message input field
  - Scrollable chat history
  - Lavender-themed message bubbles

### ⚡ Quick Actions Grid
- **Smart AI** - AI-powered safety features
- **Weather** - Weather updates and alerts
- **Location** - GPS tracking and sharing
- **Contacts** - Emergency contact management

---

## 🎨 Design System

### Color Palette
- **Primary Lavender**: `#CB94F7`
- **Light Lavender**: `#D6BEFA`
- **Background Lavender**: `#E8D5FF`
- **Accent Colors**:
  - Red: Emergency/Heart Rate
  - Blue: Steps/Information
  - Orange: Calories/Fire
  - Indigo: Sleep
  - Pink: Period Tracker
  - Green: Medical services

### UI Components
- **Rounded Corners**: 20-30px border radius
- **Soft Shadows**: Black opacity 0.05-0.1
- **Smooth Animations**: 
  - Flower rotation (3 seconds loop)
  - Page transitions
  - Card slides
- **Card Design**: White cards with subtle shadows
- **Typography**: 
  - Headers: 22-28px bold
  - Body: 14-18px regular
  - Small text: 12-14px

---

## 🛠️ Technical Stack

### Frontend Framework
- **Flutter**: 3.35.7
- **Dart SDK**: 3.9.0
- **Platform**: Cross-platform (iOS, Android, Web)

### Key Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management & Navigation
  go_router: ^14.6.2              # Declarative routing
  
  # Animations
  lottie: ^2.7.0                  # JSON-based animations
  
  # UI Components
  cupertino_icons: ^1.0.8         # iOS-style icons
  
  # Development
  flutter_lints: ^5.0.0           # Linting rules
```

### Animation Assets
- **Location**: `assets/animations/`
- **Files**:
  - `reading.json` - Miss Lara AI reading animation (200x200px)
  - `flower.json` - Positive Vibes flower animation (150x150px dialog, 60x60px card)

### Custom Components
- **FlowerPainter** - CustomPaint flower with 8 petals
  - Configurable petals, colors
  - Mathematical petal positioning using `dart:math`
  - Circular center with radiating petals

---

## 📂 Project Structure

```
raksha-sutra/
├── lib/
│   ├── main.dart                          # App entry point
│   ├── core/
│   │   ├── router/
│   │   │   └── app_router.dart            # GoRouter configuration
│   │   ├── theme/
│   │   │   └── app_theme.dart             # Theme definitions
│   │   └── wear_os/
│   │       └── wear_service.dart          # Wear OS integration
│   └── features/
│       ├── home/
│       │   └── presentation/
│       │       └── screens/
│       │           └── home_screen.dart   # Main home screen (1072 lines)
│       ├── onboarding/
│       │   └── presentation/
│       │       └── screens/
│       │           └── welcome_screen.dart # Welcome/onboarding
│       └── settings/
│           └── presentation/
│               └── screens/
│                   └── settings_screen.dart # Settings page
│
├── assets/
│   ├── animations/                        # Lottie JSON files
│   │   ├── reading.json                   # Miss Lara AI animation
│   │   └── flower.json                    # Positive Vibes flower
│   ├── icons/                             # App icons
│   └── images/                            # Image assets
│
├── android/                               # Android configuration
│   ├── app/
│   │   ├── build.gradle                   # App-level Gradle
│   │   └── src/main/
│   │       ├── AndroidManifest.xml        # Permissions & config
│   │       └── kotlin/                    # Kotlin code
│   ├── build.gradle                       # Project-level Gradle
│   └── gradle.properties                  # Gradle properties
│
├── ios/                                   # iOS configuration
│   ├── Flutter/
│   │   ├── Generated.xcconfig
│   │   └── flutter_export_environment.sh
│   └── Runner/
│       ├── GeneratedPluginRegistrant.h
│       └── GeneratedPluginRegistrant.m
│
├── pubspec.yaml                           # Dependencies & assets
├── analysis_options.yaml                  # Linting configuration
├── instructions.md                        # Development instructions
└── README.md                              # This file
```

---

## 🎯 Feature Specifications for Backend Development

### Required MongoDB Collections

#### 1. **users**
```javascript
{
  _id: ObjectId,
  email: String (unique, required),
  phoneNumber: String (unique, required),
  name: String (required),
  password: String (hashed, required),
  createdAt: Date,
  updatedAt: Date,
  profileImage: String (URL),
  deviceTokens: [String], // For push notifications
  isActive: Boolean,
  lastLogin: Date
}
```

#### 2. **emergencyContacts**
```javascript
{
  _id: ObjectId,
  userId: ObjectId (ref: users, required),
  contacts: [
    {
      name: String (required),
      phoneNumber: String (required),
      relationship: String (e.g., "Mother", "Friend"),
      isPrimary: Boolean,
      email: String,
      addedAt: Date
    }
  ],
  createdAt: Date,
  updatedAt: Date
}
```

#### 3. **sosAlerts**
```javascript
{
  _id: ObjectId,
  userId: ObjectId (ref: users, required),
  alertType: String (enum: ["single_click", "double_click"], required),
  triggerTime: Date (required),
  location: {
    type: String (default: "Point"),
    coordinates: [Number, Number] // [longitude, latitude]
  },
  status: String (enum: ["triggered", "responded", "cancelled", "completed"]),
  contactedPersons: [
    {
      contactId: ObjectId,
      contactedAt: Date,
      responseTime: Date,
      status: String
    }
  ],
  policeNotified: Boolean,
  resolvedAt: Date,
  notes: String
}
```

#### 4. **healthMetrics**
```javascript
{
  _id: ObjectId,
  userId: ObjectId (ref: users, required),
  date: Date (required),
  heartRate: {
    value: Number, // bpm
    recordedAt: Date,
    source: String (enum: ["manual", "wearable", "app"])
  },
  steps: {
    count: Number,
    goal: Number (default: 10000),
    recordedAt: Date
  },
  calories: {
    burned: Number, // kcal
    goal: Number (default: 2000),
    recordedAt: Date
  },
  sleep: {
    totalHours: Number,
    deepSleepHours: Number,
    sleepQuality: String (enum: ["poor", "fair", "good", "excellent"]),
    bedTime: Date,
    wakeTime: Date
  },
  waterIntake: {
    glasses: Number,
    goal: Number (default: 8),
    recordedAt: Date
  },
  bloodPressure: {
    systolic: Number,
    diastolic: Number,
    recordedAt: Date
  },
  createdAt: Date,
  updatedAt: Date
}
```

#### 5. **periodTracker**
```javascript
{
  _id: ObjectId,
  userId: ObjectId (ref: users, required),
  lastPeriodDate: Date (required),
  cycleLength: Number (default: 28),
  periodHistory: [
    {
      startDate: Date,
      endDate: Date,
      flow: String (enum: ["light", "medium", "heavy"]),
      symptoms: [String], // e.g., ["cramps", "mood_swings", "fatigue"]
      notes: String
    }
  ],
  predictions: {
    nextPeriodDate: Date,
    fertileWindowStart: Date,
    fertileWindowEnd: Date,
    ovulationDate: Date
  },
  createdAt: Date,
  updatedAt: Date
}
```

#### 6. **missLaraChats**
```javascript
{
  _id: ObjectId,
  userId: ObjectId (ref: users, required),
  conversations: [
    {
      message: String (required),
      sender: String (enum: ["user", "lara"], required),
      timestamp: Date (required),
      category: String (enum: ["safety_tip", "emergency", "general", "support"]),
      sentiment: String (enum: ["positive", "neutral", "urgent"])
    }
  ],
  lastInteraction: Date,
  createdAt: Date,
  updatedAt: Date
}
```

#### 7. **emergencyServices**
```javascript
{
  _id: ObjectId,
  userId: ObjectId (ref: users, required),
  serviceType: String (enum: ["domestic_violence", "harassment", "medical", "legal_aid"], required),
  requestTime: Date (required),
  status: String (enum: ["requested", "in_progress", "completed", "cancelled"]),
  location: {
    type: String (default: "Point"),
    coordinates: [Number, Number]
  },
  description: String,
  contactedService: String,
  serviceResponse: String,
  resolvedAt: Date,
  createdAt: Date,
  updatedAt: Date
}
```

#### 8. **positiveVibes**
```javascript
{
  _id: ObjectId,
  userId: ObjectId (ref: users),
  quote: String (required),
  category: String (enum: ["motivation", "strength", "courage", "self-love"]),
  viewedAt: Date,
  isFavorite: Boolean,
  userNotes: String,
  // Pre-populated quotes
  quotes: [
    "You are stronger than you think! ⭐",
    "Every day is a new beginning 🌅",
    "Believe in yourself and magic happens ✨",
    "You've got this! Keep going 💪",
    "Your courage inspires others 🌟",
    "Stay positive, stay strong 💖",
    "You are valued and loved 🌸",
    "Small steps lead to big changes 🦋"
  ]
}
```

#### 9. **locationHistory**
```javascript
{
  _id: ObjectId,
  userId: ObjectId (ref: users, required),
  timestamp: Date (required),
  location: {
    type: String (default: "Point"),
    coordinates: [Number, Number] // [longitude, latitude]
  },
  address: String,
  accuracy: Number, // meters
  speed: Number, // meters/second
  activity: String (enum: ["stationary", "walking", "running", "driving"]),
  isSafe: Boolean,
  createdAt: Date
}
```

#### 10. **notifications**
```javascript
{
  _id: ObjectId,
  userId: ObjectId (ref: users, required),
  type: String (enum: ["sos_alert", "health_reminder", "safety_tip", "system"], required),
  title: String (required),
  message: String (required),
  priority: String (enum: ["low", "medium", "high", "urgent"]),
  isRead: Boolean (default: false),
  actionRequired: Boolean,
  actionUrl: String,
  sentAt: Date,
  readAt: Date,
  expiresAt: Date
}
```

---

## 🔌 Required API Endpoints

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/logout` - User logout
- `POST /api/auth/forgot-password` - Password reset
- `PUT /api/auth/change-password` - Change password
- `GET /api/auth/profile` - Get user profile
- `PUT /api/auth/profile` - Update user profile

### Emergency Services
- `POST /api/sos/trigger` - Trigger SOS alert
- `GET /api/sos/history` - Get SOS alert history
- `PUT /api/sos/:id/status` - Update alert status
- `POST /api/emergency-services/request` - Request emergency service
- `GET /api/emergency-services/active` - Get active requests

### Emergency Contacts
- `POST /api/emergency-contacts` - Add emergency contact
- `GET /api/emergency-contacts` - Get all contacts
- `PUT /api/emergency-contacts/:id` - Update contact
- `DELETE /api/emergency-contacts/:id` - Delete contact
- `POST /api/emergency-contacts/:id/notify` - Send notification

### Health Tracking
- `POST /api/health/metrics` - Log health metrics
- `GET /api/health/metrics` - Get health data (with date range)
- `GET /api/health/metrics/latest` - Get latest metrics
- `GET /api/health/metrics/summary` - Get weekly/monthly summary
- `PUT /api/health/metrics/:id` - Update health record

### Period Tracker
- `POST /api/period/log` - Log period start
- `GET /api/period/history` - Get period history
- `GET /api/period/predictions` - Get cycle predictions
- `PUT /api/period/cycle-length` - Update cycle length

### Miss Lara AI
- `POST /api/lara/chat` - Send message to AI
- `GET /api/lara/chat/history` - Get chat history
- `POST /api/lara/safety-tip` - Request safety tip
- `DELETE /api/lara/chat/clear` - Clear chat history

### Positive Vibes
- `GET /api/quotes/random` - Get random motivational quote
- `GET /api/quotes/all` - Get all quotes
- `POST /api/quotes/favorite/:id` - Mark quote as favorite
- `GET /api/quotes/favorites` - Get favorite quotes

### Location Services
- `POST /api/location/update` - Update current location
- `GET /api/location/history` - Get location history
- `POST /api/location/share` - Share location with contact
- `GET /api/location/live/:userId` - Get live location

### Notifications
- `GET /api/notifications` - Get all notifications
- `PUT /api/notifications/:id/read` - Mark as read
- `POST /api/notifications/register-device` - Register device token
- `DELETE /api/notifications/clear` - Clear all notifications

---

## 🔐 Security Requirements

### Authentication & Authorization
- JWT-based authentication
- Refresh token mechanism
- Role-based access control (RBAC)
- Secure password hashing (bcrypt, minimum 12 rounds)
- Session management with timeout

### Data Protection
- HTTPS/TLS for all API communications
- End-to-end encryption for sensitive data
- Location data encryption at rest
- Chat message encryption
- Secure storage of emergency contacts

### Privacy Compliance
- GDPR compliance
- User consent management
- Data retention policies
- Right to deletion
- Data export functionality

### API Security
- Rate limiting (100 requests/minute per user)
- Request validation and sanitization
- SQL injection prevention
- XSS protection
- CORS configuration
- API versioning

---

## 📱 Required Permissions

### Android (AndroidManifest.xml)
```xml
<!-- Location -->
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>

<!-- Communication -->
<uses-permission android:name="android.permission.CALL_PHONE"/>
<uses-permission android:name="android.permission.SEND_SMS"/>
<uses-permission android:name="android.permission.READ_CONTACTS"/>

<!-- Internet & Network -->
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>

<!-- Notifications -->
<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
<uses-permission android:name="android.permission.VIBRATE"/>

<!-- Bluetooth (for wearables) -->
<uses-permission android:name="android.permission.BLUETOOTH"/>
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN"/>
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT"/>

<!-- Storage -->
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>

<!-- Sensors -->
<uses-permission android:name="android.permission.BODY_SENSORS"/>
<uses-permission android:name="android.permission.ACTIVITY_RECOGNITION"/>
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK: 3.35.7 or higher
- Dart SDK: 3.9.0 or higher
- Android Studio with Android SDK (API 21+)
- Xcode (for iOS development)
- Git
- MongoDB (for backend)
- Node.js (for backend)

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/Rishi12318/Raksha.git
   cd "Raksha sutra"
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Check Flutter setup**
   ```bash
   flutter doctor
   ```

4. **Run on Chrome (Web)**
   ```bash
   flutter run -d chrome
   ```

5. **Run on Android**
   ```bash
   flutter run -d android
   ```

6. **Run on iOS**
   ```bash
   flutter run -d ios
   ```

### Building for Production

**Android APK**
```bash
flutter build apk --release
```

**Android App Bundle**
```bash
flutter build appbundle --release
```

**iOS**
```bash
flutter build ios --release
```

**Web**
```bash
flutter build web --release
```

---

## 🧪 Testing

### Run Tests
```bash
flutter test
```

### Run Tests with Coverage
```bash
flutter test --coverage
```

### Integration Tests
```bash
flutter test integration_test/
```

---

## 🌐 Backend Development Guide

### Technology Stack Recommendations
- **Runtime**: Node.js (v18+) or Python (Django/Flask)
- **Database**: MongoDB (v6.0+)
- **ODM**: Mongoose (for Node.js) or Motor (for Python)
- **Authentication**: JWT + bcrypt
- **Real-time**: Socket.IO or WebSockets
- **Push Notifications**: Firebase Cloud Messaging (FCM)
- **SMS Gateway**: Twilio or AWS SNS
- **Maps/Location**: Google Maps API or Mapbox
- **AI Integration**: OpenAI API or custom ML model

### Environment Variables
```env
# Database
MONGODB_URI=mongodb://localhost:27017/raksha-sutra
MONGODB_TEST_URI=mongodb://localhost:27017/raksha-sutra-test

# JWT
JWT_SECRET=your-super-secret-jwt-key
JWT_REFRESH_SECRET=your-refresh-secret-key
JWT_EXPIRES_IN=1h
JWT_REFRESH_EXPIRES_IN=7d

# API Keys
GOOGLE_MAPS_API_KEY=your-google-maps-key
TWILIO_ACCOUNT_SID=your-twilio-sid
TWILIO_AUTH_TOKEN=your-twilio-token
TWILIO_PHONE_NUMBER=+1234567890
OPENAI_API_KEY=your-openai-key

# Firebase
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_PRIVATE_KEY=your-private-key
FIREBASE_CLIENT_EMAIL=your-client-email

# Server
PORT=3000
NODE_ENV=development
API_VERSION=v1

# Email
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASS=your-app-password

# Emergency Services
EMERGENCY_POLICE_NUMBER=112
EMERGENCY_AMBULANCE_NUMBER=108
EMERGENCY_WOMEN_HELPLINE=1091
```

### MongoDB Indexes
```javascript
// users collection
db.users.createIndex({ email: 1 }, { unique: true });
db.users.createIndex({ phoneNumber: 1 }, { unique: true });

// sosAlerts collection
db.sosAlerts.createIndex({ userId: 1, triggerTime: -1 });
db.sosAlerts.createIndex({ location: "2dsphere" });
db.sosAlerts.createIndex({ status: 1 });

// healthMetrics collection
db.healthMetrics.createIndex({ userId: 1, date: -1 });

// locationHistory collection
db.locationHistory.createIndex({ userId: 1, timestamp: -1 });
db.locationHistory.createIndex({ location: "2dsphere" });

// missLaraChats collection
db.missLaraChats.createIndex({ userId: 1, "conversations.timestamp": -1 });
```

---

## 📊 Analytics & Monitoring

### Required Metrics
- User registration rate
- Daily/Monthly active users
- SOS alert frequency and response time
- Emergency service request volume
- Health metrics usage
- Miss Lara AI engagement
- App crash rate
- API response times
- Location tracking accuracy

### Recommended Tools
- **Analytics**: Google Analytics, Mixpanel
- **Crash Reporting**: Firebase Crashlytics, Sentry
- **Performance**: Firebase Performance Monitoring
- **Logging**: CloudWatch, ELK Stack

---

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Code Style
- Follow Dart/Flutter style guide
- Use meaningful variable names
- Add comments for complex logic
- Write unit tests for new features
- Ensure all tests pass before PR

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 👥 Team & Contact

- **Project Repository**: [https://github.com/Rishi12318/Raksha](https://github.com/Rishi12318/Raksha)
- **Developer**: Rishi
- **Version**: 1.0.0
- **Last Updated**: November 7, 2025

---

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Lottie team for animation support
- Open-source community
- Women's safety organizations for inspiration

---

## 📝 Change Log

### Version 1.0.0 (November 7, 2025)
- ✅ Initial release
- ✅ SOS emergency system
- ✅ Health tracking dashboard
- ✅ Period tracker
- ✅ Miss Lara AI companion
- ✅ Positive Vibes quotes
- ✅ Emergency services integration
- ✅ Lavender-themed UI
- ✅ Lottie animations
- ✅ Slidable health cards
- ✅ Responsive design

---

## 🔮 Future Enhancements

- [ ] Real-time location sharing with contacts
- [ ] Wear OS app companion
- [ ] Voice-activated SOS
- [ ] Geofencing and safe zones
- [ ] Community safety network
- [ ] Offline emergency mode
- [ ] Multi-language support
- [ ] Dark mode theme
- [ ] Biometric authentication
- [ ] Video recording during SOS
- [ ] Integration with smart home devices
- [ ] Advanced AI chatbot with NLP
- [ ] Panic alarm with siren
- [ ] Legal document storage
- [ ] Self-defense tips and tutorials

---

**Built with 💜 for women's safety and empowerment**

