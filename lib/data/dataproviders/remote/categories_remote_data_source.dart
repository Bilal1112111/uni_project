import 'package:hello_world/core/network/api_service.dart';
import 'package:hello_world/data/models/base_model.dart';
import 'package:hello_world/data/models/category_model.dart';
import 'package:hello_world/utils/app_url.dart';

class CategoriesRemoteDataSource {
  final ApiServices _apiServices;
  CategoriesRemoteDataSource(this._apiServices);

  Future<BaseModel> listVisibleCategories() async {
    final response = await _apiServices.get(AppUrl.listVisibleCategories);
    return BaseModel.fromJson(
      response,
      (json) => BaseModels.fromJson(
        json,
        (itemJson) => CategoryModel.fromJson(itemJson),
      ),
    );
  }
}
