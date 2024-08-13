import 'package:hello_world/core/network/api_service.dart';
import 'package:hello_world/data/models/user_model.dart';
import 'package:hello_world/utils/app_url.dart';

import '../../models/base_model.dart';

class CustomerRemoteDataSource {
  final ApiServices _apiServices;
  CustomerRemoteDataSource(this._apiServices);

  Future<BaseModel<UserModel>> getAllCustomers() async {
    final response = await _apiServices.get(AppUrl.getAllCustomers);
    return BaseModel.fromJson(
      response,
      (itemJson) => UserModel.fromJson(itemJson),
    );
  }
}
