import 'products_model.dart';

class CartItemModel {
  final int cartItemId; 
  final int quantity;
  final ProductsModel product;

  CartItemModel({
    required this.cartItemId,
    required this.quantity,
    required this.product,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      cartItemId: json['id'],
      quantity: json['quantity'],
      product: ProductsModel.fromJson(json['product']),
    );
  }
}
