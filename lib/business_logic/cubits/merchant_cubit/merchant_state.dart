abstract class MerchantState {}

class MerchantInitialState extends MerchantState {}

class GetMerchantByIdLoadingState extends MerchantState {}

class GetMerchantByIdSuccessState extends MerchantState {}

class GetMerchantByIdErrorState extends MerchantState {}

class GetMerchantBranchesByIdLoadingState extends MerchantState {}

class GetMerchantBranchesByIdSuccessState extends MerchantState {}

class GetMerchantBranchesByIdErrorState extends MerchantState {}

class GetAllMerchantLoadingState extends MerchantState {}

class GetAllMerchantSuccessState extends MerchantState {}

class GetAllMerchantErrorState extends MerchantState {}

class GetMerchantStoresLoadingState extends MerchantState {}

class GetMerchantStoresSuccessState extends MerchantState {}

class GetMerchantStoresErrorState extends MerchantState {}
