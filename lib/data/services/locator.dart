import 'package:get_it/get_it.dart';
import 'package:hello_world/core/helpers/dio_helper.dart';
import 'package:hello_world/core/network/api_service.dart';
import 'package:hello_world/core/network/api_service_imp.dart';
import 'package:hello_world/data/dataproviders/remote/advertisement_remote_data_source.dart';
import 'package:hello_world/data/dataproviders/remote/auth_remote_data_source.dart';
import 'package:hello_world/data/dataproviders/remote/categories_remote_data_source.dart';
import 'package:hello_world/data/dataproviders/remote/comments_remote_data_source.dart';
import 'package:hello_world/data/dataproviders/remote/favourite_remote_data_source.dart';
import 'package:hello_world/data/dataproviders/remote/profile_remote_data_source.dart';
import 'package:hello_world/data/dataproviders/remote/store_remote_data_source.dart';
import 'package:hello_world/data/repo/advertisement_repository.dart';
import 'package:hello_world/data/repo/auth_repository.dart';
import 'package:hello_world/data/repo/categories_repository.dart';
import 'package:hello_world/data/repo/comments_repository.dart';
import 'package:hello_world/data/repo/favourite_repository.dart';
import 'package:hello_world/data/repo/merchant_repository.dart';
import 'package:hello_world/data/repo/profile_repository.dart';
import 'package:hello_world/data/repo/store_repository.dart';

import '../dataproviders/remote/merchant_remote_data_source.dart';

final getIt = GetIt.I;
Future setup() async {
  getIt.registerLazySingleton<ApiServices>(
      () => ApiServicesImp(DioHelper().dio));
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(getIt()));
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt()));
  getIt.registerLazySingleton<CategoriesRemoteDataSource>(
      () => CategoriesRemoteDataSource(getIt()));
  getIt.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepository(getIt()));
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSource(getIt()));
  getIt.registerLazySingleton<ProfileRepository>(
      () => ProfileRepository(getIt()));
  getIt.registerLazySingleton<StoreRemoteDataSource>(
      () => StoreRemoteDataSource(getIt()));
  getIt.registerLazySingleton<StoreRepository>(() => StoreRepository(getIt()));
  getIt.registerLazySingleton<MerchantRemoteDataSource>(
      () => MerchantRemoteDataSource(getIt()));
  getIt.registerLazySingleton<MerchantRepository>(
      () => MerchantRepository(getIt()));
  getIt.registerLazySingleton<FavouriteRemoteDataSource>(
      () => FavouriteRemoteDataSource(getIt()));
  getIt.registerLazySingleton<FavouriteRepository>(
      () => FavouriteRepository(getIt()));
  getIt.registerLazySingleton<AdvertisementRemoteDataSource>(
      () => AdvertisementRemoteDataSource(getIt()));
  getIt.registerLazySingleton<AdvertisementRepository>(
      () => AdvertisementRepository(getIt()));
  getIt.registerLazySingleton<CommentsRemoteDataSource>(
      () => CommentsRemoteDataSource(getIt()));
  getIt.registerLazySingleton<CommentsRepository>(
      () => CommentsRepository(getIt()));
}
