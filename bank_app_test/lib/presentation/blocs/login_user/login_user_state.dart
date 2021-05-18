part of 'login_user_bloc.dart';

class LoginUserState extends Equatable {
  final String phoneNumber;
  bool get isValidPhoneNumber => phoneNumber.length == 11;

  final String password;
  bool get isValidPassword => password.length > 2;

  final FormSubmissionStatus formStatus;

  LoginUserState({
    this.phoneNumber = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginUserState copyWith({
    String? phoneNumber,
    String? password,
    final FormSubmissionStatus? formStatus,
  }) {
    return LoginUserState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      formStatus: formStatus ?? InitialFormStatus(),
    );
  }

  @override
  List<Object> get props => [phoneNumber, password, formStatus];
}

class LoginUserInitial extends LoginUserState {}
