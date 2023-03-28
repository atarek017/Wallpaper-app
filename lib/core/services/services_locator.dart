import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wallpaper_app/feature/favourite/data/data_sorce/local_data_sorce.dart';
import 'package:wallpaper_app/feature/favourite/data/repository/fave_repository_imp.dart';
import 'package:wallpaper_app/feature/full_screen/data/data_sorce/local_data_sorce.dart';
import 'package:wallpaper_app/feature/full_screen/data/repository_imp/full_repository_imp.dart';
import 'package:wallpaper_app/feature/home/data/data_sorce/photo_remote_data_sorce.dart';
import 'package:wallpaper_app/feature/home/data/repository/photo_repository_imp.dart';
import 'package:wallpaper_app/feature/home/presentation/controller/photo/photo_bloc.dart';
import 'package:wallpaper_app/feature/search/data/data_sorce/search_remote_data_sorce.dart';
import 'package:wallpaper_app/feature/search/data/repository/search_repository_imp.dart';
import 'package:wallpaper_app/feature/search/domain/repository/search_photo_repository.dart';
import 'package:wallpaper_app/feature/search/domain/use_case/serch_photo_use_case.dart';

import '../../feature/favourite/domain/repository/fave_repository.dart';
import '../../feature/favourite/domain/use_case/get_fave_use_case.dart';
import '../../feature/favourite/presentation/controller/favourite_bloc.dart';
import '../../feature/full_screen/domain/repository/full_repository.dart';
import '../../feature/full_screen/domain/use_case/add_image_to_favorite.dart';
import '../../feature/full_screen/presentation/controller/full_image/full_image_bloc.dart';
import '../../feature/home/domain/repository/photo_repository.dart';
import '../../feature/home/domain/use_case/get_photos_use_case.dart';
import '../../feature/main/presentation/controller/main_screen_navigator_cubit.dart';
import '../../feature/search/presentation/controller/search_bloc.dart';
import '../local_data_sorce/database_helper.dart';
import '../network/dio_factory.dart';
import '../network/network_info.dart';
import '../network/network_service.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  /// Dio
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await instance<DioFactory>().getDio();

  ///Local Data Source
  instance.registerLazySingleton<DatabaseDataSource>(
      () => DatabaseDataSource.instance);

  /// NetWork Info
  instance.registerLazySingleton<NetWorkInfo>(
      () => NetWorkInfoImpl(InternetConnectionChecker()));

  /// Home
  instance.registerLazySingleton<NetworkService>(() => NetworkServicesImp(dio));

  // Photo Remote DataSource
  instance.registerLazySingleton<PhotoRemoteDataSource>(
      () => PhotoRemoteDataSourceImp(instance(), dio));

  // Photo Repository
  instance.registerLazySingleton<PhotoRepository>(
      () => PhotoRepositoryImp(instance(), instance()));

  // Get Photos UseCase
  instance.registerLazySingleton<GetPhotosUseCase>(
      () => GetPhotosUseCase(repository: instance()));
  //photo bloc
  instance.registerFactory<PhotoBloc>(() => PhotoBloc(instance()));

  /// Full Screen
  //full data source
  instance.registerLazySingleton<FullLocalDataSource>(
      () => FullLocalDataSourceImp(instance()));
  // full Repository
  instance.registerLazySingleton<FullRepository>(
      () => FullRepositoryImp(instance()));

  // Get Photos UseCase
  instance.registerLazySingleton<AddFavoritePhotosUseCase>(
      () => AddFavoritePhotosUseCase(repository: instance()));

  //Full Image bloc
  instance.registerFactory<FullImageBloc>(() => FullImageBloc(instance()));

  /// favorite
  // Photo local DataSource
  instance.registerLazySingleton<FavoriteLocalDataSource>(
      () => FavoriteLocalDataSourceImp(instance()));

  // Photo Repository
  instance.registerLazySingleton<FaveRepository>(
      () => FaveRepositoryImp(instance()));

  // Get Photos UseCase
  instance.registerLazySingleton<GetFaveImageUseCase>(
      () => GetFaveImageUseCase(repository: instance()));
  // fave bloc
  instance.registerFactory<FavouriteBloc>(() => FavouriteBloc(instance()));

  /// Search
  // Photo local DataSource
  instance.registerLazySingleton<SearchPhotoRemoteDataSource>(
      () => SearchPhotoRemoteDataSourceImp(instance(), dio));

  // Photo Repository
  instance.registerLazySingleton<SearchPhotoRepository>(
      () => SearchPhotoRepositoryImp(instance(), instance()));

  // Get Photos UseCase
  instance.registerLazySingleton<SearchPhotosUseCase>(
      () => SearchPhotosUseCase(repository: instance()));
  // fave bloc
  instance.registerFactory<SearchBloc>(() => SearchBloc(instance()));

  ///Main screen navigator bloc
  instance.registerFactory<MainScreenNavigatorCubit>(
      () => MainScreenNavigatorCubit());
}
