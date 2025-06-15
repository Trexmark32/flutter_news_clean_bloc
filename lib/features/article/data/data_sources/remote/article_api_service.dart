import 'dart:developer' as console;

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ArticleApiService {
  final Dio _dio;
  ArticleApiService(this._dio);

  Future<Response> getArticles() async {
    try {
      final response = await _dio.get(
        '${dotenv.env['NEWS_API_BASE_URL']!}/top-headlines',
        queryParameters: {
          'sources': 'techcrunch',
          'apiKey': dotenv.env['NEWS_API_KEY']!,
        },
      );
      return response;
    } on DioException catch (e) {
      console.log('Error fetching articles: ${e.message}');
      rethrow;
    }
  }
}
