abstract class StoreState {}

class StoreInitialState extends StoreState {}

class StoreByMerchantIdLoadingState extends StoreState {}

class StoreByMerchantIdSuccessState extends StoreState {}

class StoreByMerchantIdErrorState extends StoreState {}

class ShowStoreByIdLoadingState extends StoreState {}

class ShowStoreByIdSuccessState extends StoreState {}

class ShowStoreByIdErrorState extends StoreState {}

class BranchByIdLoadingState extends StoreState {}

class BranchByIdSuccessState extends StoreState {}

class BranchByIdErrorState extends StoreState {}

class ListVisibleStoreLoadingState extends StoreState {}

class ListVisibleStoreSuccessState extends StoreState {}

class ListVisibleStoreErrorState extends StoreState {}

class GetCustomerBranchesLoadingState extends StoreState {}

class GetCustomerBranchesSuccessState extends StoreState {}

class GetCustomerBranchesErrorState extends StoreState {}

class AddComplaintLoadingState extends StoreState {}

class AddComplaintErrorState extends StoreState {}

class AddComplaintSuccessState extends StoreState {}

class AddRateLoadingState extends StoreState {}

class AddRateSuccessState extends StoreState {}

class AddRateErrorState extends StoreState {}
