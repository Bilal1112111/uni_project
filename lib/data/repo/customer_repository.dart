import 'package:hello_world/core/network/error_handler/network_exception.dart';
import 'package:hello_world/data/dataproviders/remote/customer_remote_data_source.dart';
import 'package:hello_world/data/models/base_model.dart';

import '../../core/network/api_response.dart';

class CustomerRepository {
  final CustomerRemoteDataSource _customerRemoteDataSource;
  CustomerRepository(this._customerRemoteDataSource);
  Future<ApiResponse<BaseModel>> getAllCustomers() async {
    try {
      final response = await _customerRemoteDataSource.getAllCustomers();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }
}
