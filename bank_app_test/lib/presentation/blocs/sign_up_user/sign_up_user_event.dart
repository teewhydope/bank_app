part of 'sign_up_user_bloc.dart';

abstract class SignUpUserEvent extends Equatable {
  const SignUpUserEvent();
  @override
  List<Object> get props => [];
}

class SignUpPhoneNumberChanged extends SignUpUserEvent {
  final String phoneNumber;
  SignUpPhoneNumberChanged({
    required this.phoneNumber,
  });
}

class SignUpPasswordChanged extends SignUpUserEvent {
  final String password;
  SignUpPasswordChanged({
    required this.password,
  });
}

class SignUpConfirmPasswordChanged extends SignUpUserEvent {
  final String confirmPassword;
  SignUpConfirmPasswordChanged({
    required this.confirmPassword,
  });
}

class SignUpFormSubmitted extends SignUpUserEvent {}
