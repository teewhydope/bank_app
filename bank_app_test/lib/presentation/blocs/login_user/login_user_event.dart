part of 'login_user_bloc.dart';

abstract class LoginUserEvent extends Equatable {
  const LoginUserEvent();
  @override
  List<Object> get props => [];
}

class LoginPhoneNumberChanged extends LoginUserEvent {
  final String phoneNumber;
  LoginPhoneNumberChanged({
    required this.phoneNumber,
  });
}

class LoginPasswordChanged extends LoginUserEvent {
  final String password;
  LoginPasswordChanged({
    required this.password,
  });
}

class LoginFormSubmitted extends LoginUserEvent {}
