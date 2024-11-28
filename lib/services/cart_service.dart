import 'package:dio/dio.dart';
import '../models/cart_model.dart';

class CartService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://student.valuxapps.com/api/',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'lang': 'en',
      'Authorization': 'mjT8RI5NmhFDkDyGegHxDijbEVI52CIIoVLTrimc8iGO010eehsUUDwCB53Kjs5RgsJn44', 
    },
  ));

  Future<CartModel> fetchCart() async {
    try {
      final response = await _dio.get('carts');
      final cartData = response.data['data'];
      return CartModel.fromJson(cartData);
    } catch (e) {
      throw Exception('Failed to load cart');
    }
  }

  Future<void> addToCart(int productId) async {
    try {
      await _dio.post('carts', data: {'product_id': productId});
    } catch (e) {
      throw Exception('Failed to add item to cart');
    }
  }

  Future<void> updateCart(int cartId, int quantity) async {
    try {
      await _dio.put('carts/$cartId', data: {'quantity': quantity});
    } catch (e) {
      throw Exception('Failed to update cart item');
    }
  }

  // Future<void> deleteFromCart(int cartId) async {
  //   try {
  //     await _dio.delete('carts/$cartId');
  //   } catch (e) {
  //     throw Exception('Failed to delete cart item');
      
  //   }
  // }
    Future<void> deleteFromCart(int cartItemId) async {
    final response = await _dio.delete('carts/$cartItemId');
    if (response.statusCode != 200) {
      throw Exception('Failed to delete cart item');
    }
  }
}
