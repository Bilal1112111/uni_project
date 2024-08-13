import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/favourite_cubit/favourite_states.dart';
import 'package:hello_world/core/network/api_response.dart';

import '../../../data/models/favourite_model.dart';
import '../../../data/repo/favourite_repository.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final FavouriteRepository _favouriteRepository;
  FavouriteCubit(this._favouriteRepository) : super(FavouriteInitialState());
  static FavouriteCubit get(context) => BlocProvider.of(context);
  List<FavouriteModel> favouriteList = [];

  Future<void> addFavourite(int branchId) async {
    emit(AddFavouriteLoadingState());
    ApiResponse response =
        await _favouriteRepository.addFavourite(branchId: branchId);
    response.when(
      success: (data) => emit(AddFavouriteSuccessState()),
      failure: (networkExceptions) => emit(AddFavouriteErrorState()),
    );
  }

  Future<void> listFavourite() async {
    emit(GetAllFavouritesLoadingState());
    ApiResponse response = await _favouriteRepository.listFavourite();
    response.when(
      success: (data) {
        favouriteList.clear();
        for (int i = 0; i < data.data.list.length; i++) {
          FavouriteModel temp = data.data.list[i] as FavouriteModel;
          favouriteList.add(temp);
        }
        emit(GetAllFavouritesSuccessState());
      },
      failure: (networkExceptions) => emit(GetAllFavouritesErrorState()),
    );
  }
}
