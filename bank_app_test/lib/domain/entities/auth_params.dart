import 'package:equatable/equatable.dart';

class AuthParams extends Equatable {
  final String phoneNumber;
  final String password;

  AuthParams({
    required this.phoneNumber,
    required this.password,
  });

  @override
  List<Object?> get props => [phoneNumber, password];
}
