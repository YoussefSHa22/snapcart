
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/products_model.dart';
import '../../services/wishlist_service.dart';
import 'wishlist_states.dart';

class WishlistCubit extends Cubit<WishlistStates> {
  final WishlistService wishlistService;
  List<ProductsModel> _wishlistItems = [];

  WishlistCubit(this.wishlistService) : super(WishlistInitial());

  Future<void> fetchWishlist() async {
    emit(WishlistLoading());
    try {
      _wishlistItems = await wishlistService.fetchWishlist();
      emit(WishlistLoaded(_wishlistItems));
    } catch (e) {
      emit(WishlistError("Failed to load wishlist"));
    }
  }

  Future<void> toggleWishlist(ProductsModel product) async {
    try {
      product.inWishlist = !product.inWishlist;
      if (product.inWishlist) {
        await wishlistService.addToWishlist(product.id);
        _wishlistItems.add(product);
      } else {
        await wishlistService.removeFromWishlist(product.id);
        _wishlistItems.removeWhere((item) => item.id == product.id);
      }
      emit(WishlistLoaded(List.from(_wishlistItems)));
    } catch (e) {
      emit(WishlistError("Failed to update wishlist"));
    }
  }
}
