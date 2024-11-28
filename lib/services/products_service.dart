import 'package:dio/dio.dart';
import '../models/products_model.dart';

class ProductService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://student.valuxapps.com/api/',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'lang': 'en',
      'Authorization':
          'wZ8u5Ff3Pd7EoYpqqKQgnQezzLaQx0YjTKV4ADBUYMsOqLtZhY8rz7UtsRieO0oogL5Tii'
    },
  ));

  Future<List<ProductsModel>> fetchProducts() async {
    try {
      final response = await _dio.get('products');
      return (response.data['data']['data'] as List)
          .map((productJson) => ProductsModel.fromJson(productJson))
          .toList();
    } catch (e) {
      print('Fetch error: $e');
      throw Exception('Failed to fetch products');
    }
  }

  Future<List<ProductsModel>> searchProducts(String query) async {
    try {
      final response = await _dio.post(
        'products/search',
        data: {'text': query},
      );

      return (response.data['data']['data'] as List)
          .map((item) => ProductsModel.fromJson(item))
          .toList();
    } catch (e) {
      print('Search error: $e');
      throw Exception('Failed to search products');
    }
  }
}
