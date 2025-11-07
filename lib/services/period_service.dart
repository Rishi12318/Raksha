import 'api_config.dart';
import 'api_service.dart';

/// Period Tracker Service
class PeriodService {
  final ApiService _apiService = ApiService();

  /// Log period
  Future<Map<String, dynamic>> logPeriod({
    required DateTime startDate,
    DateTime? endDate,
    String? flow,
    List<String>? symptoms,
    String? notes,
  }) async {
    return await _apiService.post(
      ApiConfig.logPeriod,
      body: {
        'startDate': startDate.toIso8601String(),
        if (endDate != null) 'endDate': endDate.toIso8601String(),
        if (flow != null) 'flow': flow,
        if (symptoms != null) 'symptoms': symptoms,
        if (notes != null) 'notes': notes,
      },
    );
  }

  /// Get period history
  Future<Map<String, dynamic>> getHistory() async {
    return await _apiService.get(ApiConfig.periodHistory);
  }

  /// Get predictions
  Future<Map<String, dynamic>> getPredictions() async {
    return await _apiService.get(ApiConfig.periodPredictions);
  }

  /// Update cycle length
  Future<Map<String, dynamic>> updateCycleLength(int cycleLength) async {
    return await _apiService.put(
      ApiConfig.updateCycleLength,
      body: {'cycleLength': cycleLength},
    );
  }
}
