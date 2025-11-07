import 'api_config.dart';
import 'api_service.dart';

/// Miss Lara AI Chat Service
class LaraService {
  final ApiService _apiService = ApiService();

  /// Send message to Miss Lara
  Future<Map<String, dynamic>> sendMessage(String message) async {
    return await _apiService.post(
      ApiConfig.laraChat,
      body: {'message': message},
    );
  }

  /// Get chat history
  Future<Map<String, dynamic>> getChatHistory({int limit = 50}) async {
    return await _apiService.get(
      ApiConfig.laraChatHistory,
      queryParams: {'limit': limit.toString()},
    );
  }

  /// Get safety tip
  Future<Map<String, dynamic>> getSafetyTip() async {
    return await _apiService.post(ApiConfig.laraSafetyTip);
  }

  /// Clear chat history
  Future<Map<String, dynamic>> clearChatHistory() async {
    return await _apiService.delete(ApiConfig.clearLaraChat);
  }
}
