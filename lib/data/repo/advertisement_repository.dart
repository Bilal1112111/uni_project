import 'package:hello_world/core/network/api_response.dart';
import 'package:hello_world/core/network/error_handler/network_exception.dart';
import 'package:hello_world/data/dataproviders/remote/advertisement_remote_data_source.dart';
import 'package:hello_world/data/models/base_model.dart';

class AdvertisementRepository {
  final AdvertisementRemoteDataSource _advertisementRemoteDataSource;
  AdvertisementRepository(this._advertisementRemoteDataSource);

  Future<ApiResponse<BaseModel>> addAdvertisement(
      {required String description,
      required String phoneNumber,
      required int period,
      required String image}) async {
    try {
      final response = await _advertisementRemoteDataSource.addAdvertisement(
          description: description,
          phoneNumber: phoneNumber,
          period: period,
          image: image);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> listAdvertisements() async {
    try {
      final response =
          await _advertisementRemoteDataSource.listAdvertisements();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> advertisementsAcceptedDetails() async {
    try {
      final response =
          await _advertisementRemoteDataSource.advertisementAcceptedDetails();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }
}
