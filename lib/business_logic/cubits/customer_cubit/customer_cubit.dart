import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/customer_cubit/customer_state.dart';
import 'package:hello_world/core/network/api_response.dart';

import '../../../data/repo/customer_repository.dart';

class CustomerCubit extends Cubit<CustomerState> {
  final CustomerRepository _customerRepository;
  CustomerCubit(this._customerRepository) : super(CustomerInitialState());
  static CustomerCubit get(context) => BlocProvider.of(context);
  Future<void> getAllCustomers() async {
    emit(GetAllCustomerLoadingState());
    ApiResponse response = await _customerRepository.getAllCustomers();
    response.when(
      success: (data) => emit(GetAllCustomerSuccessState()),
      failure: (networkExceptions) => emit(GetAllCustomerErrorState()),
    );
  }
}
