
import 'package:e_commerce/blocs/products/products_cubit.dart';
import 'package:e_commerce/blocs/products/products_state.dart';
import 'package:e_commerce/blocs/wishlist/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/color_constants.dart';
import '../constants/font_constants.dart';
import '../screens/product_display.dart';

class ProductsSlider extends StatelessWidget {
  const ProductsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductsLoad) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ));
        } else if (state is ProductsLoaded) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 260,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDisplay(product: product),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              product.imageUrl,
                              height: 180,
                              width: 180,
                            ),
                            Positioned(
                              right: 15,
                              top: 10,
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .read<WishlistCubit>()
                                      .toggleWishlist(product);
                                },
                                child: Image.asset(
                                  product.inWishlist
                                      ? 'assets/images/Frame (1).png'
                                      : 'assets/images/Frame (2).png',
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            product.name.split(' ').take(3).join(' '),
                            style: AppTextStyles.header.copyWith(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1.0),
                          child: Text(
                            "${product.oldprice}",
                            style: AppTextStyles.subheader.copyWith(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 13,
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
                                style:
                                    AppTextStyles.header.copyWith(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 30),
                itemCount: 5,
              ),
            ),
          );
        } else if (state is ProductsError) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
