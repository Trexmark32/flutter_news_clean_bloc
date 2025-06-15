part of 'article_bloc.dart';

sealed class ArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;
  const ArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles, error];
}

final class ArticleInitial extends ArticleState {}

final class ArticleLoading extends ArticleState {
  const ArticleLoading();
}

final class ArticleLoaded extends ArticleState {
  const ArticleLoaded(List<ArticleEntity> articles) : super(articles: articles);
}

final class ArticleError extends ArticleState {
  const ArticleError(DioException error) : super(error: error);
}
