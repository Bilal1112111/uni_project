import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/advertisement_cubit/advertisement_state.dart';
import 'package:hello_world/core/network/api_response.dart';

import '../../../data/repo/advertisement_repository.dart';

class AdvertisementCubit extends Cubit<AdvertisementState> {
  final AdvertisementRepository _advertisementRepository;
  AdvertisementCubit(this._advertisementRepository)
      : super(AdvertisementInitialState());
  static AdvertisementCubit get(context) => BlocProvider.of(context);
  Future<void> addAdvertisement() async {
    emit(AddAdvertisementLoadingState());
    ApiResponse response = await _advertisementRepository.addAdvertisement(
        description: "description",
        phoneNumber: "phoneNumber",
        period: 5,
        image: "image");
    response.when(
      success: (data) {
        emit(AddAdvertisementSuccessState());
      },
      failure: (networkExceptions) {
        emit(AddAdvertisementErrorState());
      },
    );
  }

  Future<void> listAdvertisements() async {
    emit(ListAdvertisementsLoadingState());
    ApiResponse response = await _advertisementRepository.listAdvertisements();
    response.when(
      success: (data) {
        emit(ListAdvertisementSuccessState());
      },
      failure: (networkExceptions) {
        emit(ListAdvertisementErrorState());
      },
    );
  }

  Future<void> advertisementAcceptedDetails() async {
    emit(AdvertisementDetailsLoadingState());
    ApiResponse response =
        await _advertisementRepository.advertisementsAcceptedDetails();
    response.when(
      success: (data) {
        emit(AdvertisementDetailsSuccessState());
      },
      failure: (networkExceptions) {
        emit(AdvertisementDetailsErrorState());
      },
    );
  }
}
