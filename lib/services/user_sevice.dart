import 'package:dio/dio.dart';

import '../models/auth_model.dart';


class AuthService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://student.valuxapps.com/api/',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  Future<UserData> fetchUserProfile() async {
    final response = await _dio.get('profile');
    return UserData.fromJson(response.data['data']);
  }

  Future<void> logout() async {
    await _dio.post('logout');
  }
}
