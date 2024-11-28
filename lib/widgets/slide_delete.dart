
import 'package:e_commerce/blocs/cart/cart_cubit.dart';
import 'package:e_commerce/widgets/product_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/color_constants.dart';
import '../constants/font_constants.dart';
import '../models/cart_item_model.dart';

class SlideToDelete extends StatelessWidget {
  final List<CartItemModel> cartItems;
  const SlideToDelete({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final cartItem = cartItems[index];
        return Dismissible(
          key: ValueKey(cartItem.cartItemId),
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
            context.read<CartCubit>().deleteFromCart(cartItem.cartItemId);
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
                  Image.network(cartItem.product.imageUrl),
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
                              cartItem.product.name.split(' ').take(3).join(),
                              style: AppTextStyles.header.copyWith(fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Row(
                            children: [
                              Text(
                                'EGP',
                                style: AppTextStyles.subheader.copyWith(fontSize: 13),
                              ),
                              Text(
                                '${cartItem.product.price}',
                                style: AppTextStyles.header.copyWith(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  ProductCounter(),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemCount: cartItems.length,
    );
  }
}
