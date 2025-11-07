import 'api_config.dart';
import 'api_service.dart';

/// SOS Service for emergency alerts
class SosService {
  final ApiService _apiService = ApiService();

  /// Trigger SOS alert
  Future<Map<String, dynamic>> triggerSOS({
    required String alertType, // 'single_click' or 'double_click'
    Map<String, double>? location,
    String? notes,
  }) async {
    return await _apiService.post(
      ApiConfig.triggerSOS,
      body: {
        'alertType': alertType,
        if (location != null) 'location': location,
        if (notes != null) 'notes': notes,
      },
    );
  }

  /// Get SOS history
  Future<Map<String, dynamic>> getSOSHistory({
    int page = 1,
    int limit = 20,
    String? status,
  }) async {
    return await _apiService.get(
      ApiConfig.sosHistory,
      queryParams: {
        'page': page.toString(),
        'limit': limit.toString(),
        if (status != null) 'status': status,
      },
    );
  }

  /// Update SOS status
  Future<Map<String, dynamic>> updateSOSStatus({
    required String id,
    required String status,
    String? notes,
  }) async {
    return await _apiService.put(
      ApiConfig.sosStatus(id),
      body: {
        'status': status,
        if (notes != null) 'notes': notes,
      },
    );
  }
}
