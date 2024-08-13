import 'package:hello_world/core/network/error_handler/network_exception.dart';
import 'package:hello_world/data/dataproviders/remote/favourite_remote_data_source.dart';
import 'package:hello_world/data/models/base_model.dart';

import '../../core/network/api_response.dart';

class FavouriteRepository {
  final FavouriteRemoteDataSource _favouriteRemoteDataSource;
  FavouriteRepository(this._favouriteRemoteDataSource);

  Future<ApiResponse<BaseModel>> addFavourite({required int branchId}) async {
    try {
      final response =
          await _favouriteRemoteDataSource.addFavourite(branchId: branchId);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> listFavourite() async {
    try {
      final response = await _favouriteRemoteDataSource.listFavourite();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }
}
