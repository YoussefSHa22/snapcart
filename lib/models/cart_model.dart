import 'cart_item_model.dart';

class CartModel {
  final List<CartItemModel> cartItems;
  final double subTotal;
  final double total;

  CartModel({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      cartItems: (json['cart_items'] as List)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
      subTotal: json['sub_total']?.toDouble() ?? 0.0,
      total: json['total']?.toDouble() ?? 0.0,
    );
  }
}
