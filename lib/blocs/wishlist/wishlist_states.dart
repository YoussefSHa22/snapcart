import '../../models/products_model.dart';


abstract class WishlistStates {}

class WishlistInitial extends WishlistStates {}

class WishlistLoading extends WishlistStates {}

class WishlistLoaded extends WishlistStates {
  final List<ProductsModel> wishlistItems;
  WishlistLoaded(this.wishlistItems);
}

class WishlistError extends WishlistStates {
  final String message;
  WishlistError(this.message);
}
