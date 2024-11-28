import 'dart:math';

import 'package:e_commerce/blocs/products/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/products_service.dart';

class ProductsCubit extends Cubit<ProductState> {
  final ProductService _productService;

  ProductsCubit(this._productService) : super(ProductsInt());

  Future<void> fetchProducts() async {
    try {
      emit(ProductsLoad());
      final products = await _productService.fetchProducts();
      products.shuffle(Random());
      emit(ProductsLoaded(products));
    } catch (e) {
      print('Fetch error: $e');
      emit(ProductsError('Failed to load products'));
    }
  }
}
