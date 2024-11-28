import '../../models/products_model.dart';

abstract class ProductState {}

class ProductsInt extends ProductState {}

class ProductsLoad extends ProductState {}

class ProductsLoaded extends ProductState {
  final List<ProductsModel> products;
  ProductsLoaded(this.products);
}

class ProductsError extends ProductState {
  final String message;
  ProductsError(this.message);
}
