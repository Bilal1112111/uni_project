import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/setting_cubit/setting_state.dart';
import 'package:hello_world/core/network/error_handler/network_exception.dart';
import 'package:hello_world/screens/favourite_screen.dart';
import 'package:hello_world/screens/home_screen.dart';
import 'package:hello_world/screens/notification_screen.dart';
import 'package:hello_world/screens/settings/deep_setting_screen.dart';

import '../../../core/network/api_response.dart';
import '../../../data/repo/profile_repository.dart';

class SettingCubit extends Cubit<SettingStates> {
  final ProfileRepository _profileRepository;
  SettingCubit(this._profileRepository) : super(SettingInitialState());
  static SettingCubit get(context) => BlocProvider.of(context);

  List<String> settingListLabels = [
    'الإشعارات',
    'قائمة المفضلة',
    'الإعدادات',
    'سياسة الخصوصية',
    'الأسئلة الشائعة',
    'حول التطبيق',
  ];
  List<IconData> settingListIcons = [
    Icons.notifications,
    Icons.favorite_outlined,
    Icons.settings,
    Icons.privacy_tip_rounded,
    Icons.question_mark_outlined,
    Icons.info_rounded,
  ];
  List<String> settingRouteList = [
    NotificationScreen.route,
    FavouritesScreen.route,
    DeepSettingScreen.route,
    HomeScreen.route,
    HomeScreen.route,
    HomeScreen.route,
  ];
  List<String> deepSettingListLabels = [
    'تعديل حسابك',
    'حذف حسابك',
    'حذف دون استرجاع',
  ];
  List<IconData> deepSettingListIcons = [
    Icons.edit,
    Icons.remove_circle,
    Icons.remove_circle,
  ];
  TextEditingController updateProfileFirstNameController =
      TextEditingController();
  TextEditingController updateProfileLastNameController =
      TextEditingController();
  TextEditingController updateProfilePhoneController = TextEditingController();

  Future<void> getProfile() async {
    emit(GetProfileDetailsLoadingState());
    ApiResponse response = await _profileRepository.getProfile();
    response.when(
      success: (data) => emit(GetProfileDetailsSuccessState()),
      failure: (networkExceptions) => emit(GetProfileDetailsErrorState()),
    );
  }

  Future<void> updateProfile() async {
    emit(UpdateProfileLoadingState());
    ApiResponse response = await _profileRepository.updateProfile(
      firstName: updateProfileFirstNameController.text,
      lastName: updateProfileLastNameController.text,
      phone: updateProfilePhoneController.text,
    );
    response.when(
        success: (data) => emit(UpdateProfileSuccessState()),
        failure: (error) => emit(UpdateProfileErrorState()));
  }

  Future<void> softAccountDelete() async {
    emit(SoftDeleteLoadingState());
    ApiResponse response = await _profileRepository.softAccountDelete();
    response.when(
      success: (data) {
        emit(SoftDeleteSuccessState());
        print('-----------------------------------success');
      },
      failure: (networkExceptions) {
        emit(SoftDeleteErrorState());
        print(NetworkExceptions.getException(networkExceptions));
      },
    );
  }

  Future<void> hardAccountDelete() async {
    emit(HardDeleteLoadingState());
    ApiResponse response = await _profileRepository.hardAccountDelete();
    response.when(
      success: (data) => emit(HardDeleteSuccessState()),
      failure: (networkExceptions) => emit(HardDeleteErrorState()),
    );
  }
}
