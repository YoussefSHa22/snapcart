import 'package:e_commerce/blocs/cart/cart_cubit.dart';
import 'package:e_commerce/blocs/wishlist/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/color_constants.dart';
import '../constants/font_constants.dart';
import '../models/products_model.dart';

class WishlistItems extends StatelessWidget {
  final List<ProductsModel> wishlistItems;
  const WishlistItems({super.key, required this.wishlistItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final product = wishlistItems[index];
          return Dismissible(
            key: ValueKey(product.id),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 30,
              ),
            ),
            onDismissed: (direction) {
              context.read<WishlistCubit>().toggleWishlist(product);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('${product.name} removed from wishlist')),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.secondryColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.network(
                      product.imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Text(
                                product.name.split(' ').take(2).join(),
                                style:
                                    AppTextStyles.header.copyWith(fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Row(
                              children: [
                                Text(
                                  'EGP',
                                  style: AppTextStyles.subheader
                                      .copyWith(fontSize: 13),
                                ),
                                Text(
                                  '${product.price}',
                                  style: AppTextStyles.header
                                      .copyWith(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CartCubit>().addToCart(product.id);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: AppColors.secondryColor,
                      ),
                      child: const Text("Add to Cart"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: wishlistItems.length,
      ),
    );
  }
}
