import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/store_cubit/store_state.dart';
import 'package:hello_world/core/network/api_response.dart';
import 'package:hello_world/data/models/branch_model.dart';

import '../../../data/models/store_model.dart';
import '../../../data/repo/store_repository.dart';

class StoreCubit extends Cubit<StoreState> {
  final StoreRepository _storeRepository;
  StoreCubit(this._storeRepository) : super(StoreInitialState());
  static StoreCubit get(context) => BlocProvider.of(context);
  List<StoreModel> stores = [];
  List<BranchModel> branches = [];
  //
  // Future<void> storeById(int id) async {
  //   emit(StoreByMerchantIdLoadingState());
  //   ApiResponse response = await _storeRepository.storeById(id: id);
  //   response.when(
  //     success: (data) => emit(StoreByMerchantIdSuccessState()),
  //     failure: (networkExceptions) => emit(StoreByMerchantIdErrorState()),
  //   );
  // }
  //
  // Future<void> showStoreById(String id) async {
  //   emit(ShowStoreByIdLoadingState());
  //   ApiResponse response = await _storeRepository.showStoreById(storeId: id);
  //   response.when(
  //     success: (data) => emit(ShowStoreByIdSuccessState()),
  //     failure: (networkExceptions) => emit(ShowStoreByIdErrorState()),
  //   );
  // }

  // Future<void> listVisibleStores() async {
  //   emit(ListVisibleStoreLoadingState());
  //   ApiResponse response = await _storeRepository.listVisibleStores();
  //   response.when(
  //     success: (data) {
  //       stores.clear();
  //       for (int i = 0; i < data.data.list.length; i++) {
  //         StoreModel temp = data.data.list[i] as StoreModel;
  //         stores.add(temp);
  //       }
  //       emit(ListVisibleStoreSuccessState());
  //     },
  //     failure: (networkExceptions) => emit(ListVisibleStoreErrorState()),
  //   );
  // }

  Future<void> branchById() async {
    emit(BranchByIdLoadingState());
    ApiResponse response = await _storeRepository.branchById(id: '1');
    response.when(
      success: (data) {
        branches.clear();
        for (int i = 0; i < data.data.list.length; i++) {
          BranchModel temp = data.data.list[i] as BranchModel;
          branches.add(temp);
        }
        emit(BranchByIdSuccessState());
      },
      failure: (networkExceptions) => emit(BranchByIdErrorState()),
    );
  }

  Future<void> listCustomerBranches() async {
    emit(GetCustomerBranchesLoadingState());
    ApiResponse response = await _storeRepository.listCustomerBranches();
    response.when(
      success: (data) {
        branches.clear();
        for (int i = 0; i < data.data.list.length; i++) {
          BranchModel temp = data.data.list[i] as BranchModel;
          branches.add(temp);
        }
        emit(GetCustomerBranchesSuccessState());
      },
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

  Future<void> addRate() async {
    emit(AddRateLoadingState());
    ApiResponse response =
        await _storeRepository.addRate(branchId: 1, rate: '2');
    response.when(
      success: (data) {
        emit(AddRateSuccessState());
      },
      failure: (networkExceptions) {
        emit(AddRateErrorState());
      },
    );
  }
}
