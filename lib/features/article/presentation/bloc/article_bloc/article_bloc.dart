import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_demo/core/resources/data_strate.dart';
import 'package:flutter_clean_demo/features/article/domain/entities/article_entity.dart';
import 'package:flutter_clean_demo/features/article/domain/usecases/get_article_usecase.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticleUsecase _getArticleUsecase;
  ArticleBloc(this._getArticleUsecase) : super(ArticleInitial()) {
    on<GetArticleEvent>((event, emit) async {
      emit(const ArticleLoading());
      final dataState = await _getArticleUsecase();

      if (dataState is DataSuccess<List<ArticleEntity>>) {
        if (dataState.data != null && dataState.data!.isNotEmpty) {
          emit(ArticleLoaded(dataState.data!));
        } else {
          emit(const ArticleLoaded([]));
        }
      } else if (dataState is DataFailed<List<ArticleEntity>>) {
        emit(ArticleError(dataState.error!));
      }
    });
  }
}
