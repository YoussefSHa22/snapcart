import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/services/auth_service.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthService authService;

  AuthCubit(this.authService) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final authResponse = await authService.login(email, password);
      if (authResponse.status) {
        emit(AuthSuccess(authResponse.data!));
      } else {
        emit(AuthFailure(authResponse.message ?? 'Login failed'));
      }
    } catch (e) {
      emit(AuthFailure('An error occurred during login'));
    }
  }
  

  Future<void> register(
      String name, String phone, String email, String password) async {
    emit(AuthLoading());
    try {
      final authResponse =
          await authService.register(name, phone, email, password);
      if (authResponse.status) {
        emit(AuthSuccess(authResponse.data!));
      } else {
        emit(AuthFailure(authResponse.message ?? 'Registration failed'));
      }
    } catch (e) {
      emit(AuthFailure('An error occurred during registration'));
    }
  }
}
