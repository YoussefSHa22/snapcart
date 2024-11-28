

import '../../models/cart_model.dart';

abstract class CartStates {}

class Cartint extends CartStates {}

class CartLoad extends CartStates {}

class CartLoaded extends CartStates {
  final CartModel cartModel;

  CartLoaded(this.cartModel);
}

class CartError extends CartStates {
  final String message;
  CartError(this.message);
}
