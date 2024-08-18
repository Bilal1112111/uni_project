abstract class AdvertisementState {}

class AdvertisementInitialState extends AdvertisementState {}

class AddAdvertisementLoadingState extends AdvertisementState {}

class AddAdvertisementErrorState extends AdvertisementState {}

class AddAdvertisementSuccessState extends AdvertisementState {}

class ListAdvertisementsLoadingState extends AdvertisementState {}

class ListAdvertisementSuccessState extends AdvertisementState {}

class ListAdvertisementErrorState extends AdvertisementState {}

class AdvertisementDetailsLoadingState extends AdvertisementState {}

class AdvertisementDetailsErrorState extends AdvertisementState {}

class AdvertisementDetailsSuccessState extends AdvertisementState {}

class ChangeImageState extends AdvertisementState {}
