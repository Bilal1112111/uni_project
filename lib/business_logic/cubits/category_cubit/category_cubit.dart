import 'package:bloc/bloc.dart';
import 'package:hello_world/core/network/api_response.dart';

import '../../../data/models/category_model.dart';
import '../../../data/repo/categories_repository.dart';
import 'category_states.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository _categoriesRepository;
  CategoriesCubit(this._categoriesRepository) : super(CategoriesInitialState());

  List<CategoryModel> categories = [];

  Future<void> listVisibleCategories() async {
    emit(CategoriesLoadingState());
    ApiResponse response = await _categoriesRepository.listVisibleCategories();
    response.when(
      success: (data) {
        categories.clear();
        for (int i = 0; i < data.data.list.length; i++) {
          CategoryModel temp = data.data.list[i] as CategoryModel;
          categories.add(temp);
        }
        emit(CategoriesSuccessState());
      },
      failure: (error) => emit(CategoriesErrorState()),
    );
  }
}
