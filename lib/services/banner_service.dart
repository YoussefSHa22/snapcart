import 'package:dio/dio.dart';

class BannerService {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: 'https://student.valuxapps.com/api/', headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  }));

  Future<List<String>> fetchbanners() async {
    try {
      final response = await _dio.get('banners');

      return (response.data['data'] as List)
          .map((banner) => banner['image'] as String)
          .toList();
    } catch (e) {
      throw Exception('failed to fetch banners');
    }
  }
}
