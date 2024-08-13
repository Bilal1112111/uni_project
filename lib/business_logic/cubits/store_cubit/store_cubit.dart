import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/store_cubit/store_state.dart';
import 'package:hello_world/core/network/api_response.dart';

import '../../../data/models/store_model.dart';
import '../../../data/repo/store_repository.dart';

class StoreCubit extends Cubit<StoreState> {
  final StoreRepository _storeRepository;
  StoreCubit(this._storeRepository) : super(StoreInitialState());
  static StoreCubit get(context) => BlocProvider.of(context);
  List<StoreModel> stores = [];

  Future<void> storeById() async {
    emit(StoreByIdLoadingState());
    ApiResponse response = await _storeRepository.storeById(id: 1);
    response.when(
      success: (data) => emit(StoreByIdSuccessState()),
      failure: (networkExceptions) => emit(StoreByIdErrorState()),
    );
  }

  Future<void> listVisibleStores() async {
    emit(ListVisibleStoreLoadingState());
    ApiResponse response = await _storeRepository.listVisibleStores();
    response.when(
      success: (data) {
        stores.clear();
        for (int i = 0; i < data.data.list.length; i++) {
          StoreModel temp = data.data.list[i] as StoreModel;
          stores.add(temp);
        }
        emit(ListVisibleStoreSuccessState());
      },
      failure: (networkExceptions) => emit(ListVisibleStoreErrorState()),
    );
  }

  Future<void> branchById() async {
    emit(BranchByIdLoadingState());
    ApiResponse response = await _storeRepository.branchById(id: 1);
    response.when(
      success: (data) => emit(BranchByIdSuccessState()),
      failure: (networkExceptions) => emit(BranchByIdErrorState()),
    );
  }

  Future<void> listCustomerBranches() async {
    emit(GetCustomerBranchesLoadingState());
    ApiResponse response = await _storeRepository.listCustomerBranches();
    response.when(
      success: (data) => emit(GetCustomerBranchesSuccessState()),
      failure: (networkExceptions) => emit(GetCustomerBranchesErrorState()),
    );
  }

  Future<void> addComplaint() async {
    emit(AddComplaintLoadingState());
    ApiResponse response = await _storeRepository.addComplaint(
        complaint: "complaint", branchId: 1);
    response.when(
      success: (data) => emit(AddComplaintSuccessState()),
      failure: (networkExceptions) => emit(AddComplaintErrorState()),
    );
  }
}
