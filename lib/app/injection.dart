import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pinapp_challenge/core/network/network_info.dart';
import 'package:pinapp_challenge/core/network/network_info_impl.dart';
import 'package:pinapp_challenge/data/repositories/post_repository_impl.dart';
import 'package:pinapp_challenge/data/services/api.dart';
import 'package:pinapp_challenge/data/services/api_impl.dart';
import 'package:pinapp_challenge/domain/repositories/post_repository.dart';
import 'package:pinapp_challenge/domain/usecases/_usecases.dart';
import 'package:pinapp_challenge/native_api/comments_api.dart';
import 'package:pinapp_challenge/presentation/bloc/posts_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl
    // Services
    ..registerLazySingleton(() => http.Client())
    // Core
    ..registerLazySingleton(() => InternetConnectionChecker())
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()))
    // Data
    ..registerLazySingleton<Api>(() => ApiImpl(client: sl()))
    ..registerLazySingleton<CommentsApi>(() => CommentsApi())
    // Repository
    ..registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(
        api: sl(),
        networkInfo: sl(),
      ),
    )
    // UseCases
    ..registerLazySingleton(() => GetPosts(sl()))
    ..registerLazySingleton(() => GetComments(sl()))
    // Bloc
    ..registerFactory(() => PostsBloc(getComments: sl(), getPosts: sl()));
}
