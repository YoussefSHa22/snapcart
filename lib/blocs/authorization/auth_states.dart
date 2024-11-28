

import '../../models/auth_model.dart';

abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class AuthSuccess extends AuthStates {
  final UserData userData;
  AuthSuccess(this.userData);
}

class AuthFailure extends AuthStates {
  final String message;
  AuthFailure(this.message);
}
