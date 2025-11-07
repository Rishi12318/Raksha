import 'api_config.dart';
import 'api_service.dart';

/// Health Metrics Service
class HealthService {
  final ApiService _apiService = ApiService();

  /// Log health metrics
  Future<Map<String, dynamic>> logMetrics({
    DateTime? date,
    Map<String, dynamic>? heartRate,
    Map<String, dynamic>? steps,
    Map<String, dynamic>? calories,
    Map<String, dynamic>? sleep,
    Map<String, dynamic>? waterIntake,
    Map<String, dynamic>? bloodPressure,
  }) async {
    return await _apiService.post(
      ApiConfig.logHealthMetrics,
      body: {
        if (date != null) 'date': date.toIso8601String(),
        if (heartRate != null) 'heartRate': heartRate,
        if (steps != null) 'steps': steps,
        if (calories != null) 'calories': calories,
        if (sleep != null) 'sleep': sleep,
        if (waterIntake != null) 'waterIntake': waterIntake,
        if (bloodPressure != null) 'bloodPressure': bloodPressure,
      },
    );
  }

  /// Get health metrics
  Future<Map<String, dynamic>> getMetrics({
    DateTime? startDate,
    DateTime? endDate,
    int page = 1,
    int limit = 30,
  }) async {
    return await _apiService.get(
      ApiConfig.getHealthMetrics,
      queryParams: {
        if (startDate != null) 'startDate': startDate.toIso8601String(),
        if (endDate != null) 'endDate': endDate.toIso8601String(),
        'page': page.toString(),
        'limit': limit.toString(),
      },
    );
  }

  /// Get latest metrics
  Future<Map<String, dynamic>> getLatestMetrics() async {
    return await _apiService.get(ApiConfig.latestHealthMetrics);
  }

  /// Get metrics summary
  Future<Map<String, dynamic>> getMetricsSummary({String period = 'week'}) async {
    return await _apiService.get(
      ApiConfig.healthMetricsSummary,
      queryParams: {'period': period},
    );
  }

  /// Update health metric
  Future<Map<String, dynamic>> updateMetric({
    required String id,
    Map<String, dynamic>? heartRate,
    Map<String, dynamic>? steps,
    Map<String, dynamic>? calories,
    Map<String, dynamic>? sleep,
    Map<String, dynamic>? waterIntake,
    Map<String, dynamic>? bloodPressure,
  }) async {
    return await _apiService.put(
      ApiConfig.updateHealthMetric(id),
      body: {
        if (heartRate != null) 'heartRate': heartRate,
        if (steps != null) 'steps': steps,
        if (calories != null) 'calories': calories,
        if (sleep != null) 'sleep': sleep,
        if (waterIntake != null) 'waterIntake': waterIntake,
        if (bloodPressure != null) 'bloodPressure': bloodPressure,
      },
    );
  }
}
