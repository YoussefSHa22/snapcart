
 
import 'package:dio/dio.dart';

import '../models/products_model.dart';

class WishlistService {
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

  Future<List<ProductsModel>> fetchWishlist() async {
    final response = await _dio.get('favorites');
    return (response.data['data']['data'] as List)
        .map((item) => ProductsModel.fromJson(item['product']))
        .toList();
  }

  Future<void> addToWishlist(int productId) async {
    await _dio.post('favorites', data: {'product_id': productId});
  }

  Future<void> removeFromWishlist(int productId) async {
    await _dio.delete('favorites/$productId');
  }
}
