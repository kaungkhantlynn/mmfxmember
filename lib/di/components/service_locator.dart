import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/api/blog/auth_api.dart';
import '../../data/network/api/blog/author_api.dart';
import '../../data/network/api/blog/profile_api.dart';
import '../../data/network/dio_client.dart';
import '../../data/network/rest_client.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/repository/author_repository.dart';
import '../../data/repository/profile_repository.dart';
import '../../data/sharedpref/shared_preference_helper.dart';
import '../module/local_module.dart';
import '../module/network_module.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<SharedPreferences>(() => LocalModule.provideSharedPreferences());

  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(NetworkModule.provideDio(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(RestClient());

  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(AuthApi(getIt<DioClient>()));
  getIt.registerSingleton(ProfileApi(getIt<DioClient>()));
  getIt.registerSingleton(AuthorApi(getIt<DioClient>()));

  //auth
  getIt.registerSingleton<AuthRepository>(AuthRepository(getIt<AuthApi>(),getIt<SharedPreferenceHelper>(),));
  getIt.registerSingleton<ProfileRepository>(ProfileRepository(getIt<ProfileApi>()));
  getIt.registerSingleton<AuthorRepository>(AuthorRepository(getIt<AuthorApi>()));
  // getIt.registerSingleton<PostsRepository>(PostsRepository(getIt<PostsApi>()));


  // api's:---------------------------------------------------------------------
  // getIt.registerSingleton(AuthApi(getIt<DioClient>(), getIt<RestClient>()));
  // getIt.registerSingleton(BlogApi(getIt<DioClient>(), getIt<RestClient>()));

  // auth repository:----------------------------------------------------------------
  // getIt.registerSingleton(AuthRepository(
  //   getIt<AuthApi>(),
  //   getIt<SharedPreferenceHelper>(),
  // ));
  //
  // // blog repository: ----------------------------------------------------------------
  // getIt.registerSingleton(BlogRepository(
  //   getIt<BlogApi>(),
  //   getIt<SharedPreferenceHelper>(),
  // ));

  // bloc: --------------------------------------------------------------------
  // getIt.registerSingleton(AuthenticationBloc(getIt<AuthRepository>()));
  // getIt.registerSingleton(BlogBloc(getIt<BlogRepository>()));
}
