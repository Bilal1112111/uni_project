import 'package:hello_world/core/network/error_handler/network_exception.dart';
import 'package:hello_world/data/dataproviders/remote/store_remote_data_source.dart';
import 'package:hello_world/data/models/base_model.dart';

import '../../core/network/api_response.dart';

class StoreRepository {
  final StoreRemoteDataSource _storeRemoteDataSource;
  StoreRepository(this._storeRemoteDataSource);

  Future<ApiResponse<BaseModel>> storeById({required int id}) async {
    try {
      final response = await _storeRemoteDataSource.storeById(id: id);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> listVisibleStores() async {
    try {
      final response = await _storeRemoteDataSource.listVisibleStores();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> branchById({required int id}) async {
    try {
      final response = await _storeRemoteDataSource.branchById(id: id);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> listCustomerBranches() async {
    try {
      final response = await _storeRemoteDataSource.listCustomerBranches();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> addComplaint(
      {required String complaint, required int branchId}) async {
    try {
      final response = await _storeRemoteDataSource.addComplaint(
          complaint: complaint, branchId: branchId);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }
}
