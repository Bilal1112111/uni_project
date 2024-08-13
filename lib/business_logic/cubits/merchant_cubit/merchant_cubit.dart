import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/merchant_cubit/merchant_state.dart';
import 'package:hello_world/core/network/api_response.dart';

import '../../../data/repo/merchant_repository.dart';

class MerchantCubit extends Cubit<MerchantState> {
  final MerchantRepository _merchantRepository;
  MerchantCubit(this._merchantRepository) : super(MerchantInitialState());
  static MerchantCubit get(context) => BlocProvider.of(context);
  Future<void> merchantById() async {
    emit(GetMerchantByIdLoadingState());
    ApiResponse response = await _merchantRepository.merchantById();
    response.when(
        success: (data) => emit(GetMerchantByIdSuccessState()),
        failure: (error) => emit(GetMerchantByIdErrorState()));
  }

  Future<void> listMerchantBranches() async {
    emit(GetMerchantBranchesByIdLoadingState());
    ApiResponse response = await _merchantRepository.listMerchantBranches();
    response.when(
        success: (data) => emit(GetMerchantBranchesByIdSuccessState()),
        failure: (error) => emit(GetMerchantBranchesByIdErrorState()));
  }

  Future<void> getAllMerchants() async {
    emit(GetAllMerchantLoadingState());
    ApiResponse response = await _merchantRepository.getAllMerchants();
    response.when(
        success: (data) => emit(GetAllMerchantSuccessState()),
        failure: (error) => emit(GetAllMerchantErrorState()));
  }

  Future<void> listMerchantStores() async {
    emit(GetMerchantStoresErrorState());
    ApiResponse response = await _merchantRepository.listMerchantStores();
    response.when(
        success: (data) => emit(GetMerchantStoresSuccessState()),
        failure: (error) => emit(GetMerchantStoresErrorState()));
  }
}
