import 'package:flutter_clean_demo/core/resources/data_state.dart';
import 'package:flutter_clean_demo/features/article/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getArticles();
}
