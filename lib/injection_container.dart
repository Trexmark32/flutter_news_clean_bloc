import 'package:dio/dio.dart';
import 'package:flutter_clean_demo/features/article/data/data_sources/remote/article_api_service.dart';
import 'package:flutter_clean_demo/features/article/data/repository/article_repository_impl.dart';
import 'package:flutter_clean_demo/features/article/domain/repository/article_repository.dart';
import 'package:flutter_clean_demo/features/article/domain/usecases/get_article_usecase.dart';
import 'package:flutter_clean_demo/features/article/presentation/bloc/article_bloc/article_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Network Calls
  sl.registerLazySingleton(() => Dio());

  // Api Service
  sl.registerLazySingleton(() => ArticleApiService(sl()));

  // Repository
  sl.registerLazySingleton<ArticleRepository>(
    () => ArticleRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetArticleUsecase(sl()));

  // Blocs
  sl.registerFactory(() => ArticleBloc(sl()));

  // Additional dependencies can be registered here
}
