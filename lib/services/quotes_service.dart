import 'api_config.dart';
import 'api_service.dart';

/// Quotes Service for motivational quotes
class QuotesService {
  final ApiService _apiService = ApiService();

  /// Get random quote
  Future<Map<String, dynamic>> getRandomQuote() async {
    return await _apiService.get(ApiConfig.randomQuote);
  }

  /// Get all quotes
  Future<Map<String, dynamic>> getAllQuotes() async {
    return await _apiService.get(ApiConfig.allQuotes);
  }

  /// Mark quote as favorite
  Future<Map<String, dynamic>> markFavorite({
    required String id,
    required String quote,
    required String category,
  }) async {
    return await _apiService.post(
      ApiConfig.markQuoteFavorite(id),
      body: {
        'quote': quote,
        'category': category,
      },
    );
  }

  /// Get favorite quotes
  Future<Map<String, dynamic>> getFavorites() async {
    return await _apiService.get(ApiConfig.favoriteQuotes);
  }
}
