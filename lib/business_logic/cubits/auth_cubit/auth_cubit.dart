import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/helpers/dio_helper.dart';
import '../../../core/helpers/fire_base_helper.dart';
import '../../../core/interceptors/token_interceptor.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/error_handler/network_exception.dart';
import '../../../data/dataproviders/local/shared_preferences.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repo/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  String? token;
  TextEditingController emailOrPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController forgetPasswordEmailSendController =
      TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  TextEditingController newChangePasswordController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  bool newIsVisible = true;
  bool confirmIsVisible = true;
  TextEditingController forgetPasswordChangeEmail = TextEditingController();
  TextEditingController forgetPasswordChangeNewPassword =
      TextEditingController();
  TextEditingController restoreAccountEmailController = TextEditingController();
  TextEditingController restoreAccountPasswordController =
      TextEditingController();
  List<TextEditingController> textEditingControllersList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<IconData> iconsList = [
    Icons.person,
    Icons.person_2,
    Icons.mail,
    Icons.phone,
    Icons.lock,
    Icons.lock,
    Icons.work_rounded
  ];
  List<String> labelsList = [
    'الاسم الأول',
    'الاسم الأخير',
    'البريد الالكتروني',
    'رقم الهاتف',
    'كلمة المرور',
    'تأكيد كلمة المرور',
    'User or Merchant',
  ];
  List<TextInputType> inputTypeList = [
    TextInputType.name,
    TextInputType.name,
    TextInputType.emailAddress,
    TextInputType.phone,
    TextInputType.visiblePassword,
    TextInputType.visiblePassword,
    TextInputType.text,
  ];
  List<bool> visibleList = [false, false, false, false, true, true, false];

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
          print('--------------------- $imageName');
          selectedImage = await pickedImage.readAsBytes();
          ;
        }
        break;
      default:
        selectedImage = null;
    }
    return selectedImage;
  }

  bool checkBoxValue = false;
  void changeCheckBoxValue() {
    checkBoxValue = !checkBoxValue;
    emit(CheckBoxValueState());
  }

  bool emailCheckBoxValue = true;
  void changeEmailCheckBoxValue() {
    emailCheckBoxValue = !emailCheckBoxValue;
    phoneCheckBoxValue = false;
    emit(LoginEmailCheckBoxValueState());
  }

  bool phoneCheckBoxValue = false;
  void changePhoneCheckBoxValue() {
    phoneCheckBoxValue = !phoneCheckBoxValue;
    emailCheckBoxValue = false;
    emit(LoginPhoneCheckBoxValueState());
  }

  Map<String, dynamic>? errorData;
  String? validate(
    String label,
  ) {
    if (errorData != null) {
      if (errorData!['errors'][label] != null) {
        return errorData!['errors'][label][0];
      }
    }
    return null;
  }

  void newPasswordVisibility() {
    newIsVisible = !newIsVisible;
    emit(NewPasswordVisibilityState());
  }

  void confirmPasswordVisibility() {
    confirmIsVisible = !confirmIsVisible;
    emit(ConfirmNewPasswordVisibilityState());
  }

  void selectImageChange(Uint8List newImage) {
    selectedImage = newImage;
    emit(ChangeImageState());
  }

  Future<void> register() async {
    emit(RegisterLoadingState());
    ApiResponse response = await _authRepository.register(
      firstName: textEditingControllersList[0].text,
      lastName: textEditingControllersList[1].text,
      email: textEditingControllersList[2].text,
      phoneNumber: textEditingControllersList[3].text,
      role: textEditingControllersList[6].text,
      password: textEditingControllersList[4].text,
      confirmPassword: textEditingControllersList[5].text,
      image: selectedImage,
      imageName: imageName,
    );

    response.when(success: (data) {
      userModel = data.data;
      emit(RegisterSuccessState());
    }, failure: (error) {
      emit(RegisterErrorState());
    });
  }

  Future<void> login() async {
    await FireBaseHelper.initFirebaseMessaging();
    final deviceData = await FireBaseHelper.getDeviceInfo();
    emit(DeviceInfoState());
    emit(LoginLoadingState());
    ApiResponse response = await _authRepository.login(
        email: emailOrPhoneController.text,
        password: passwordController.text,
        deviceId: deviceData['deviceId'],
        deviceName: deviceData['deviceName'],
        notificationToken: deviceData['notificationToken']);
    response.when(
      success: (data) {
        emit(LoginSuccessState());
        userModel = data.data;
      },
      failure: (networkExceptions) {
        print(NetworkExceptions.getErrorMessage(networkExceptions));
        emit(LoginErrorState());
      },
    );
    DioHelper()
        .dio
        .interceptors
        .add(TokenInterceptor(SharedPreference.getData(key: 'access_token')));
  }

  Future<void> verifyEmail({required String code}) async {
    emit(VerifyEmailLoadingState());
    await FireBaseHelper.initFirebaseMessaging();
    final deviceData = await FireBaseHelper.getDeviceInfo();
    emit(DeviceInfoState());
    ApiResponse response = await _authRepository.verifyEmail(
        email: textEditingControllersList[2].text,
        code: code,
        deviceName: deviceData['deviceName'],
        deviceId: deviceData['deviceId'],
        notificationToken: deviceData['notificationToken']);
    response.when(
      success: (data) => emit(VerifyEmailSuccessState()),
      failure: (networkExceptions) => emit(VerifyEmailErrorState()),
    );
  }

  Future<void> resendVerifyEmailCode() async {
    emit(ResendVerifyEmailLoadingState());
    final response = await _authRepository.resendVerifyEmail(
      email: textEditingControllersList[2].text,
    );
    response.when(
      success: (data) => emit(ResendVerifyEmailSuccessState()),
      failure: (networkExceptions) => emit(ResendVerifyEmailErrorState()),
    );
  }

  Future<void> forgetPassword() async {
    emit(ForgetPasswordLoadingState());
    ApiResponse response = await _authRepository.forgetPassword(
        email: forgetPasswordEmailSendController.text);
    response.when(
      success: (data) => emit(ForgetPasswordSuccessState()),
      failure: (networkExceptions) => emit(ForgetPasswordErrorState()),
    );
  }

  Future<void> forgetPasswordCode({required String code}) async {
    emit(ForgetPasswordCodeLoadingState());
    await FireBaseHelper.initFirebaseMessaging();
    final deviceData = await FireBaseHelper.getDeviceInfo();
    emit(DeviceInfoState());
    ApiResponse response = await _authRepository.forgetPasswordCode(
      email: forgetPasswordEmailSendController.text,
      code: code,
      deviceId: deviceData['deviceId'],
      deviceName: deviceData['deviceName'],
      notificationToken: deviceData['notificationToken'],
    );
    response.when(
      success: (data) => emit(ForgetPasswordCodeSuccessState()),
      failure: (networkExceptions) => emit(ForgetPasswordCodeErrorState()),
    );
  }

  Future<void> resendForgetPasswordVerifyCode() async {
    emit(ForgetPasswordResendCodeLoadingState());
    ApiResponse response = await _authRepository.resendForgetPasswordVerifyCode(
        email: forgetPasswordEmailSendController.text);
    response.when(
        success: (data) => emit(ForgetPasswordResendCodeSuccessState()),
        failure: (error) => emit(ForgetPasswordResendCodeErrorState()));
  }

  Future<void> forgetPasswordChange() async {
    emit(ForgetPasswordChangeLoadingState());
    ApiResponse response = await _authRepository.forgetPasswordChange(
        email: forgetPasswordChangeEmail.text,
        newPassword: forgetPasswordChangeNewPassword.text);
    response.when(
      success: (data) => emit(ForgetPasswordChangeSuccessState()),
      failure: (networkExceptions) => emit(ForgetPasswordChangeErrorState()),
    );
  }

  Future<void> logOut() async {
    emit(LogoutLoadingState());
    await FireBaseHelper.initFirebaseMessaging();
    final deviceData = await FireBaseHelper.getDeviceInfo();
    emit(DeviceInfoState());
    ApiResponse response =
        await _authRepository.logOut(deviceId: deviceData['deviceId']);

    response.when(
        success: (data) {
          SharedPreference.delete('access_token');
          return emit(LogoutSuccessState());
        },
        failure: (networkExceptions) => emit(LogoutErrorState()));
  }

  Future<void> restoreAccount() async {
    emit(RestoreAccountLoadingState());
    ApiResponse response = await _authRepository.restoreAccount(
        email: restoreAccountEmailController.text,
        password: restoreAccountPasswordController.text);
    response.when(
      success: (data) => emit(RestoreAccountSuccessState()),
      failure: (networkExceptions) => emit(RestoreAccountErrorState()),
    );
  }
}
