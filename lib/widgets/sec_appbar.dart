import 'package:e_commerce/constants/color_constants.dart';
import 'package:e_commerce/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_cubit.dart';
import '../blocs/cart/cart_states.dart';

class SecAppbar extends StatelessWidget {
  final String page;

  const SecAppbar({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          page == 'home'
              ? InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.primaryColor,
                    child: Transform.scale(
                      scale: 1.2,
                      child: const Image(
                        image: AssetImage('assets/images/arrow (1).png'),
                      ),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.primaryColor,
                    child: Transform.scale(
                      scale: 1.2,
                      child: const Image(
                        image: AssetImage('assets/images/Vector (5).png'),
                      ),
                    ),
                  ),
                ),
          const Spacer(),
          BlocBuilder<CartCubit, CartStates>(
            builder: (context, state) {
              int itemCount = 0;
              if (state is CartLoaded) {
                itemCount = state.cartModel.cartItems.length;
              }

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            spreadRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.secondryColor,
                        child: Transform.scale(
                          scale: 1.2,
                          child: Image.asset(
                            'assets/images/icon (2).png',
                            width: 40,
                            height: 40,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (itemCount > 0)
                    Positioned(
                      top: -5,
                      right: -5,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '$itemCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
