import 'package:hello_world/core/helpers/dio_helper.dart';

import '../../data/dataproviders/local/shared_preferences.dart';
import '../interceptors/token_interceptor.dart';

class SharedHelper {
  static bool isThereToken() {
    String? accessToken = SharedPreference.getData(key: 'access_token');
    if (accessToken == null) {
      return false;
    } else {
      DioHelper().dio.interceptors.add(TokenInterceptor(accessToken));
      return true;
    }
  }
}
