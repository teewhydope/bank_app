part of 'sign_up_user_bloc.dart';

class SignUpUserState extends Equatable {
  final String phoneNumber;
  bool get isValidPhoneNumber => phoneNumber.length == 11;

  final String password;
  bool get isValidPassword => password.length > 2;

  final String confirmPassword;

  bool get isConfirmPassword => password == confirmPassword;

  final FormSubmissionStatus formStatus;

  SignUpUserState({
    this.phoneNumber = '',
    this.password = '',
    this.confirmPassword = '',
    this.formStatus = const InitialFormStatus(),
  });

  SignUpUserState copyWith({
    String? phoneNumber,
    String? password,
    String? confirmPassword,
    final FormSubmissionStatus? formStatus,
  }) {
    return SignUpUserState(
      phoneNumber: phoneNumber?.trim() ?? this.phoneNumber.trim(),
      password: password?.trim() ?? this.password.trim(),
      confirmPassword: confirmPassword?.trim() ?? this.confirmPassword.trim(),
      formStatus: formStatus ?? InitialFormStatus(),
    );
  }

  @override
  List<Object> get props =>
      [phoneNumber, password, confirmPassword, formStatus];
}

class SignUpUserInitial extends SignUpUserState {}
