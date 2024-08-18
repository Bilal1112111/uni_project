import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/advertisement_cubit/advertisement_state.dart';
import 'package:hello_world/core/network/api_response.dart';
import 'package:hello_world/core/network/error_handler/network_exception.dart';
import 'package:hello_world/data/models/advertisement_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repo/advertisement_repository.dart';

class AdvertisementCubit extends Cubit<AdvertisementState> {
  final AdvertisementRepository _advertisementRepository;
  AdvertisementCubit(this._advertisementRepository)
      : super(AdvertisementInitialState());
  static AdvertisementCubit get(context) => BlocProvider.of(context);
  AdvertisementModel? advertisementModel;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  Uint8List? selectedImage;
  String? imageName;
  Future<Uint8List?> pickImage(ImageSource imageSource) async {
    ImagePicker imagePicker = ImagePicker();

    switch (imageSource) {
      case ImageSource.camera:
        final pickedImage =
            await imagePicker.pickImage(source: ImageSource.camera);

        if (pickedImage != null) {
          imageName = pickedImage.name;
          selectedImage = await pickedImage.readAsBytes();
        }
        break;
      case ImageSource.gallery:
        final pickedImage =
            await imagePicker.pickImage(source: ImageSource.gallery);
        if (pickedImage != null) {
          imageName = pickedImage.name;

          selectedImage = await pickedImage.readAsBytes();
          ;
        }
        break;
      default:
        selectedImage = null;
    }
    return selectedImage;
  }

  void selectImageChange(Uint8List newImage) {
    selectedImage = newImage;
    emit(ChangeImageState());
  }

  Future<void> addAdvertisement() async {
    emit(AddAdvertisementLoadingState());
    ApiResponse response = await _advertisementRepository.addAdvertisement(
      description: descriptionController.text,
      phoneNumber: phoneController.text,
      period: periodController.text,
      image: selectedImage!,
      imageName: imageName!,
    );
    response.when(
      success: (data) {
        emit(AddAdvertisementSuccessState());
        advertisementModel = data.data;
      },
      failure: (networkExceptions) {
        print(NetworkExceptions.getErrorMessage(networkExceptions));
        emit(AddAdvertisementErrorState());
      },
    );
  }

  Future<void> listAdvertisements() async {
    emit(ListAdvertisementsLoadingState());
    ApiResponse response = await _advertisementRepository.listAdvertisements();
    response.when(
      success: (data) {
        emit(ListAdvertisementSuccessState());
      },
      failure: (networkExceptions) {
        emit(ListAdvertisementErrorState());
      },
    );
  }

  Future<void> advertisementAcceptedDetails() async {
    emit(AdvertisementDetailsLoadingState());
    ApiResponse response =
        await _advertisementRepository.advertisementsAcceptedDetails();
    response.when(
      success: (data) {
        emit(AdvertisementDetailsSuccessState());
      },
      failure: (networkExceptions) {
        emit(AdvertisementDetailsErrorState());
      },
    );
  }
}
