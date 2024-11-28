import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/services/cart_service.dart';
import 'package:e_commerce/blocs/cart/cart_states.dart';


class CartCubit extends Cubit<CartStates> {
  final CartService cartService;

  CartCubit(this.cartService) : super(Cartint());

  Future<void> fetchCart() async {
    try {
      emit(CartLoad());
      final cartModel = await cartService.fetchCart();
      emit(CartLoaded(cartModel));
    } catch (e) {
      emit(CartError('Failed to load cart'));
    }
  }

  Future<void> addToCart(int productId) async {
    try {
      await cartService.addToCart(productId);
      await fetchCart(); 
    } catch (e) {
      emit(CartError('Failed to add item to cart'));
    }
  }

  Future<void> updateCart(int cartId, int quantity) async {
    try {
      await cartService.updateCart(cartId, quantity);
      await fetchCart(); 
    } catch (e) {
      emit(CartError('Failed to update cart item'));
    }
  }

  Future<void> deleteFromCart(int cartId) async {
    try {
      await cartService.deleteFromCart(cartId);
      await fetchCart();
    } catch (e) {
      emit(CartError('Failed to delete cart item'));
    }
  }
}
