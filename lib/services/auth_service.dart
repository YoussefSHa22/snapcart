
import 'package:dio/dio.dart';
import '../models/auth_model.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://student.valuxapps.com/api/',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'lang': 'en',
    'Authorization': 'mjT8RI5NmhFDkDyGegHxDijbEVI52CIIoVLTrimc8iGO010eehsUUDwCB53Kjs5RgsJn44', 
    },
  ));

  

  Future<AuthResponseModel> login(String email, String password) async {
    final response = await _dio.post('login', data: {
      "email": email,
      "password": password,
    });
    return AuthResponseModel.fromJson(response.data);
  }

  Future<AuthResponseModel> register(
      String name, String phone, String email, String password) async {
    final response = await _dio.post('register', data: {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
    });
    return AuthResponseModel.fromJson(response.data);
  }

  Future<UserData> fetchUserProfile() async {
    final response = await _dio.get('profile');
    return UserData.fromJson(response.data['data']);
  }

  Future<void> logout() async {
    await _dio.post('logout');
  }
}

