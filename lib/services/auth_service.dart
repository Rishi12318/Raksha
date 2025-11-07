import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_config.dart';
import 'api_service.dart';

/// Authentication Service for handling user authentication
class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userKey = 'user_data';

  final ApiService _apiService = ApiService();

  /// Register new user
  Future<Map<String, dynamic>> register({
    required String email,
    required String phoneNumber,
    required String name,
    required String password,
  }) async {
    final response = await _apiService.post(
      ApiConfig.register,
      body: {
        'email': email,
        'phoneNumber': phoneNumber,
        'name': name,
        'password': password,
      },
    );

    if (response['success'] == true) {
      await _saveAuthData(response['data']);
    }

    return response;
  }

  /// Login user
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiService.post(
      ApiConfig.login,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response['success'] == true) {
      await _saveAuthData(response['data']);
    }

    return response;
  }

  /// Get user profile
  Future<Map<String, dynamic>> getProfile() async {
    return await _apiService.get(ApiConfig.profile);
  }

  /// Update user profile
  Future<Map<String, dynamic>> updateProfile({
    String? name,
    String? phoneNumber,
    String? profileImage,
  }) async {
    return await _apiService.put(
      ApiConfig.updateProfile,
      body: {
        if (name != null) 'name': name,
        if (phoneNumber != null) 'phoneNumber': phoneNumber,
        if (profileImage != null) 'profileImage': profileImage,
      },
    );
  }

  /// Change password
  Future<Map<String, dynamic>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    return await _apiService.put(
      ApiConfig.changePassword,
      body: {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      },
    );
  }

  /// Logout user
  Future<void> logout() async {
    try {
      await _apiService.post(ApiConfig.logout);
    } finally {
      await _clearAuthData();
    }
  }

  /// Save authentication data
  Future<void> _saveAuthData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, data['token']);
    await prefs.setString(_refreshTokenKey, data['refreshToken']);
    await prefs.setString(_userKey, json.encode(data['user']));
  }

  /// Clear authentication data
  Future<void> _clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_userKey);
  }

  /// Get stored token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  /// Get stored user data
  Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString(_userKey);
    if (userData != null) {
      return json.decode(userData);
    }
    return null;
  }

  /// Check if user is logged in
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }
}
