abstract class StoreState {}

class StoreInitialState extends StoreState {}

class StoreByIdLoadingState extends StoreState {}

class StoreByIdSuccessState extends StoreState {}

class StoreByIdErrorState extends StoreState {}

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
