import 'package:e_commerce/blocs/cart/cart_cubit.dart';
import 'package:e_commerce/constants/color_constants.dart';
import 'package:e_commerce/constants/font_constants.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCartButton extends StatelessWidget {
  final ProductsModel product;
  const AddCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CartCubit>().addToCart(product.id);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * 0.07 * 0.5)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.height * 0.07 * 0.3),
                child: Image.asset(
                  'assets/images/Group.png',
                  color: AppColors.secondryColor,
                ),
              ),
              Text(
                'Add to Cart',
                style: AppTextStyles.header.copyWith(
                    color: AppColors.secondryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
