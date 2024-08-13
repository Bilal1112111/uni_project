import 'package:hello_world/core/network/api_response.dart';
import 'package:hello_world/core/network/error_handler/network_exception.dart';
import 'package:hello_world/data/dataproviders/remote/merchant_remote_data_source.dart';
import 'package:hello_world/data/models/base_model.dart';

class MerchantRepository {
  final MerchantRemoteDataSource _merchantRemoteDataSource;
  MerchantRepository(this._merchantRemoteDataSource);
  Future<ApiResponse<BaseModel>> merchantById() async {
    try {
      final response = await _merchantRemoteDataSource.merchantById();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> listMerchantBranches() async {
    try {
      final response = await _merchantRemoteDataSource.listMerchantBranches();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> getAllMerchants() async {
    try {
      final response = await _merchantRemoteDataSource.getAllMerchants();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> listMerchantStores() async {
    try {
      final response = await _merchantRemoteDataSource.listMerchantStores();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }
}
