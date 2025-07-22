import 'package:flutter_clean_demo/core/resources/data_state.dart';
import 'package:flutter_clean_demo/core/usecases/usecase.dart';
import 'package:flutter_clean_demo/features/article/domain/entities/article_entity.dart';
import 'package:flutter_clean_demo/features/article/domain/repository/article_repository.dart';

class GetArticleUsecase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  GetArticleUsecase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) async {
    return await _articleRepository.getArticles();
  }
}
