# Raksha Sutra Frontend - Backend API Integration

## 🔌 Backend Connection Setup

Your Raksha Sutra Flutter app is now integrated with the backend API!

### Backend Repository
**Backend API:** https://github.com/Rishi12318/Raksha123

### API Base URL
- **Development:** `http://localhost:5000/api`
- **Production:** Update in `lib/services/api_config.dart`

---

## 📦 API Services Created

### 1. **Authentication Service** (`auth_service.dart`)
```dart
// Register
await AuthService().register(
  email: 'user@example.com',
  phoneNumber: '+1234567890',
  name: 'Jane Doe',
  password: 'SecurePass123!',
);

// Login
await AuthService().login(
  email: 'user@example.com',
  password: 'SecurePass123!',
);

// Get Profile
await AuthService().getProfile();

// Logout
await AuthService().logout();
```

### 2. **SOS Service** (`sos_service.dart`)
```dart
// Trigger SOS
await SosService().triggerSOS(
  alertType: 'double_click',
  location: {'latitude': 28.6139, 'longitude': 77.2090},
  notes: 'Emergency',
);

// Get SOS History
await SosService().getSOSHistory(page: 1, limit: 20);
```

### 3. **Health Service** (`health_service.dart`)
```dart
// Log Health Metrics
await HealthService().logMetrics(
  heartRate: {'value': 72, 'source': 'wearable'},
  steps: {'count': 5000, 'goal': 10000},
  calories: {'burned': 1450, 'goal': 2000},
);

// Get Latest Metrics
await HealthService().getLatestMetrics();

// Get Summary
await HealthService().getMetricsSummary(period: 'week');
```

### 4. **Miss Lara AI Service** (`lara_service.dart`)
```dart
// Chat with Miss Lara
await LaraService().sendMessage('I need safety tips');

// Get Chat History
await LaraService().getChatHistory(limit: 50);

// Get Safety Tip
await LaraService().getSafetyTip();
```

### 5. **Quotes Service** (`quotes_service.dart`)
```dart
// Get Random Quote
await QuotesService().getRandomQuote();

// Get All Quotes
await QuotesService().getAllQuotes();

// Mark Favorite
await QuotesService().markFavorite(
  id: 'quote_id',
  quote: 'You are stronger than you think! ⭐',
  category: 'strength',
);
```

### 6. **Period Service** (`period_service.dart`)
```dart
// Log Period
await PeriodService().logPeriod(
  startDate: DateTime.now(),
  flow: 'medium',
  symptoms: ['cramps', 'mood_swings'],
);

// Get Predictions
await PeriodService().getPredictions();
```

---

## 🚀 Quick Start

### 1. Install Dependencies

Add to `pubspec.yaml`:
```yaml
dependencies:
  http: ^1.1.0
  shared_preferences: ^2.2.2
```

Then run:
```bash
flutter pub get
```

### 2. Start Backend Server

```bash
cd C:\Users\rishi\raksha_backend
npm start
```

Backend will run on: `http://localhost:5000`

### 3. Update API Base URL

If deploying to production, edit `lib/services/api_config.dart`:
```dart
static const String productionUrl = 'https://your-api.com/api';
static const bool isProduction = true; // Change to true for production
```

### 4. Use Services in Your App

Example in a Flutter widget:
```dart
import 'package:raksha_sutra/services/auth_service.dart';
import 'package:raksha_sutra/services/sos_service.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final AuthService _authService = AuthService();
  final SosService _sosService = SosService();

  Future<void> login() async {
    try {
      final response = await _authService.login(
        email: 'test@example.com',
        password: 'Test123!',
      );
      
      if (response['success']) {
        print('Login successful!');
        // Navigate to home screen
      }
    } catch (e) {
      print('Login failed: $e');
      // Show error message
    }
  }

  Future<void> triggerEmergency() async {
    try {
      final response = await _sosService.triggerSOS(
        alertType: 'double_click',
        location: {'latitude': 28.6139, 'longitude': 77.2090},
      );
      
      if (response['success']) {
        print('SOS triggered!');
        // Show confirmation
      }
    } catch (e) {
      print('SOS failed: $e');
      // Show error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: login,
            child: Text('Login'),
          ),
          ElevatedButton(
            onPressed: triggerEmergency,
            child: Text('Trigger SOS'),
          ),
        ],
      ),
    );
  }
}
```

---

## 🔐 Authentication Flow

### 1. Register/Login
```dart
// Register
await AuthService().register(
  email: email,
  phoneNumber: phone,
  name: name,
  password: password,
);

// Login
await AuthService().login(email: email, password: password);
```

### 2. Token Management
Tokens are automatically stored using `SharedPreferences` and included in all API requests.

### 3. Check Login Status
```dart
bool isLoggedIn = await AuthService().isLoggedIn();
```

### 4. Logout
```dart
await AuthService().logout();
```

---

## 🛠️ API Configuration

### Endpoints Available

All endpoints are defined in `lib/services/api_config.dart`:

- **Authentication:** register, login, profile, logout
- **SOS:** trigger, history, status
- **Emergency Services:** request, active requests
- **Emergency Contacts:** CRUD operations
- **Health Metrics:** log, get, summary
- **Period Tracker:** log, history, predictions
- **Miss Lara AI:** chat, history, tips
- **Quotes:** random, all, favorites
- **Location:** update, history, share
- **Notifications:** get, mark read, register device

### Error Handling

All services throw `ApiException` on errors:

```dart
try {
  await HealthService().logMetrics(...);
} on ApiException catch (e) {
  print('API Error: ${e.message}');
  print('Status Code: ${e.statusCode}');
} catch (e) {
  print('Unexpected error: $e');
}
```

---

## 📡 Testing API Connection

### Test Backend Health
```dart
import 'package:raksha_sutra/services/api_service.dart';
import 'package:raksha_sutra/services/api_config.dart';

Future<void> testConnection() async {
  try {
    final response = await ApiService().get(ApiConfig.healthCheck);
    print('Backend Status: ${response['status']}');
    print('Database: ${response['database']}');
  } catch (e) {
    print('Connection failed: $e');
  }
}
```

---

## 🔄 Data Flow

```
Flutter App 
    ↓
API Service (api_service.dart)
    ↓
HTTP Request with JWT Token
    ↓
Backend API (localhost:5000)
    ↓
MongoDB Database (progome)
    ↓
Response to Flutter App
```

---

## 📝 Environment Configuration

### Development
- Backend: `http://localhost:5000/api`
- Database: `mongodb://localhost:27017/progome`

### Production
1. Deploy backend to cloud (Heroku, AWS, Azure, etc.)
2. Update `api_config.dart`:
   ```dart
   static const String productionUrl = 'https://api.rakshasutra.com/api';
   static const bool isProduction = true;
   ```
3. Update environment variables in backend

---

## 🐛 Troubleshooting

### "Connection failed" Error
- Ensure backend server is running: `npm start`
- Check if MongoDB is running
- Verify API base URL in `api_config.dart`

### "Unauthorized" Error
- User needs to login
- Check if token is stored
- Token may have expired (refresh)

### "No internet connection" Error
- Check device network connection
- Verify backend server is accessible

---

## 📚 Additional Resources

- **Backend Documentation:** See `raksha_backend/API_DOCUMENTATION.md`
- **Backend Quick Start:** See `raksha_backend/QUICK_START.md`
- **Frontend README:** See main `README.md`

---

## 🎯 Next Steps

1. ✅ Backend API running on localhost:5000
2. ✅ API services created in Flutter
3. ⬜ Add `http` and `shared_preferences` to pubspec.yaml
4. ⬜ Run `flutter pub get`
5. ⬜ Update your screens to use API services
6. ⬜ Test all features end-to-end
7. ⬜ Deploy backend to production
8. ⬜ Update production API URL

---

**Your Raksha Sutra app is now connected to the backend! 🛡️💜**

Backend: http://localhost:5000
Frontend: Ready for integration
Database: progome (MongoDB)
