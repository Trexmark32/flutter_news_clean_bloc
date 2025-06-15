import 'dart:developer' as console;

import 'package:dio/dio.dart';
import 'package:flutter_clean_demo/core/resources/data_strate.dart';
import 'package:flutter_clean_demo/features/article/data/data_sources/remote/article_api_service.dart';
import 'package:flutter_clean_demo/features/article/data/models/article_model.dart';
import 'package:flutter_clean_demo/features/article/domain/repository/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final ArticleApiService _articleApiService;
  ArticleRepositoryImpl(this._articleApiService);

  @override
  Future<DataState<List<ArticleModel>>> getArticles() async {
    try {
      final response = await _articleApiService.getArticles();
      if (response.data["status"] == "ok") {
        final List<ArticleModel> articles = (response.data['articles'] as List)
            .map((article) => ArticleModel.fromJson(article))
            .toList();
        return DataSuccess(articles);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
            error: 'Failed to fetch articles',
          ),
        );
      }
    } on Exception catch (e) {
      console.log('Error fetching articles: ${e.toString()}');
      return DataFailed(
        DioException(
          requestOptions: RequestOptions(path: ''),
          error: e.toString(),
        ),
      );
    }
  }
}
