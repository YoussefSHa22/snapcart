import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/auth_service.dart';
import 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthService authService;

  ProfileCubit(this.authService) : super(ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    try {
      final user = await authService.fetchUserProfile();
      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError("Failed to load profile"));
    }
  }

  Future<void> logout() async {
    await authService.logout();
    emit(ProfileInitial());
  }
}
