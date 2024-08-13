import 'package:hello_world/core/network/api_response.dart';

import '../../core/network/error_handler/network_exception.dart';
import '../dataproviders/remote/categories_remote_data_source.dart';
import '../models/base_model.dart';

class CategoriesRepository {
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;
  CategoriesRepository(this._categoriesRemoteDataSource);

  Future<ApiResponse<BaseModel>> listVisibleCategories() async {
    try {
      final response =
          await _categoriesRemoteDataSource.listVisibleCategories();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
      print(NetworkExceptions.getException(error));
    }
  }
}
