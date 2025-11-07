/// API Configuration for Raksha Sutra Backend
/// 
/// This file contains all API endpoints and configuration
/// for connecting to the Raksha Sutra backend server

class ApiConfig {
  // Base URLs
  static const String baseUrl = 'http://localhost:5000/api';
  static const String productionUrl = 'https://your-production-url.com/api';
  
  // Environment
  static const bool isProduction = false;
  
  // Get current base URL
  static String get apiBaseUrl => isProduction ? productionUrl : baseUrl;
  
  // Authentication Endpoints
  static String get register => '$apiBaseUrl/auth/register';
  static String get login => '$apiBaseUrl/auth/login';
  static String get profile => '$apiBaseUrl/auth/profile';
  static String get updateProfile => '$apiBaseUrl/auth/profile';
  static String get changePassword => '$apiBaseUrl/auth/change-password';
  static String get logout => '$apiBaseUrl/auth/logout';
  
  // SOS Endpoints
  static String get triggerSOS => '$apiBaseUrl/sos/trigger';
  static String get sosHistory => '$apiBaseUrl/sos/history';
  static String sosStatus(String id) => '$apiBaseUrl/sos/$id/status';
  
  // Emergency Services Endpoints
  static String get requestEmergencyService => '$apiBaseUrl/emergency-services/request';
  static String get activeEmergencyRequests => '$apiBaseUrl/emergency-services/active';
  static String emergencyServiceStatus(String id) => '$apiBaseUrl/emergency-services/$id/status';
  
  // Emergency Contacts Endpoints
  static String get emergencyContacts => '$apiBaseUrl/emergency-contacts';
  static String emergencyContact(String id) => '$apiBaseUrl/emergency-contacts/$id';
  
  // Health Metrics Endpoints
  static String get logHealthMetrics => '$apiBaseUrl/health/metrics';
  static String get getHealthMetrics => '$apiBaseUrl/health/metrics';
  static String get latestHealthMetrics => '$apiBaseUrl/health/metrics/latest';
  static String get healthMetricsSummary => '$apiBaseUrl/health/metrics/summary';
  static String updateHealthMetric(String id) => '$apiBaseUrl/health/metrics/$id';
  
  // Period Tracker Endpoints
  static String get logPeriod => '$apiBaseUrl/period/log';
  static String get periodHistory => '$apiBaseUrl/period/history';
  static String get periodPredictions => '$apiBaseUrl/period/predictions';
  static String get updateCycleLength => '$apiBaseUrl/period/cycle-length';
  
  // Miss Lara AI Endpoints
  static String get laraChat => '$apiBaseUrl/lara/chat';
  static String get laraChatHistory => '$apiBaseUrl/lara/chat/history';
  static String get laraSafetyTip => '$apiBaseUrl/lara/safety-tip';
  static String get clearLaraChat => '$apiBaseUrl/lara/chat/clear';
  
  // Quotes Endpoints
  static String get randomQuote => '$apiBaseUrl/quotes/random';
  static String get allQuotes => '$apiBaseUrl/quotes/all';
  static String markQuoteFavorite(String id) => '$apiBaseUrl/quotes/favorite/$id';
  static String get favoriteQuotes => '$apiBaseUrl/quotes/favorites';
  
  // Location Endpoints
  static String get updateLocation => '$apiBaseUrl/location/update';
  static String get locationHistory => '$apiBaseUrl/location/history';
  static String get shareLocation => '$apiBaseUrl/location/share';
  static String liveLocation(String userId) => '$apiBaseUrl/location/live/$userId';
  
  // Notifications Endpoints
  static String get notifications => '$apiBaseUrl/notifications';
  static String markNotificationRead(String id) => '$apiBaseUrl/notifications/$id/read';
  static String get registerDevice => '$apiBaseUrl/notifications/register-device';
  static String get clearNotifications => '$apiBaseUrl/notifications/clear';
  
  // Health Check
  static String get healthCheck => '$apiBaseUrl/health-check';
  
  // Timeout durations
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
