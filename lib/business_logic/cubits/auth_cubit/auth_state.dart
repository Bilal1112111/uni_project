abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class RegisterSuccessState extends AuthStates {}

class RegisterErrorState extends AuthStates {}

class RegisterCheckBoxValueState extends AuthStates {}

class RegisterLoadingState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginErrorState extends AuthStates {}

class CheckBoxValueState extends AuthStates {}

class LoginEmailCheckBoxValueState extends AuthStates {}

class LoginPhoneCheckBoxValueState extends AuthStates {}

class NewPasswordVisibilityState extends AuthStates {}

class ConfirmNewPasswordVisibilityState extends AuthStates {}

class ChangeImageState extends AuthStates {}

class VerifyEmailLoadingState extends AuthStates {}

class VerifyEmailSuccessState extends AuthStates {}

class VerifyEmailErrorState extends AuthStates {}

class ResendVerifyEmailLoadingState extends AuthStates {}

class ResendVerifyEmailSuccessState extends AuthStates {}

class ResendVerifyEmailErrorState extends AuthStates {}

class ForgetPasswordLoadingState extends AuthStates {}

class ForgetPasswordSuccessState extends AuthStates {}

class ForgetPasswordErrorState extends AuthStates {}

class ForgetPasswordCodeLoadingState extends AuthStates {}

class ForgetPasswordCodeSuccessState extends AuthStates {}

class ForgetPasswordCodeErrorState extends AuthStates {}

class ForgetPasswordResendCodeLoadingState extends AuthStates {}

class ForgetPasswordResendCodeSuccessState extends AuthStates {}

class ForgetPasswordResendCodeErrorState extends AuthStates {}

class DeviceInfoState extends AuthStates {}

class ForgetPasswordChangeLoadingState extends AuthStates {}

class ForgetPasswordChangeSuccessState extends AuthStates {}

class ForgetPasswordChangeErrorState extends AuthStates {}

class LogoutLoadingState extends AuthStates {}

class LogoutSuccessState extends AuthStates {}

class LogoutErrorState extends AuthStates {}

class RestoreAccountLoadingState extends AuthStates {}

class RestoreAccountSuccessState extends AuthStates {}

class RestoreAccountErrorState extends AuthStates {}
