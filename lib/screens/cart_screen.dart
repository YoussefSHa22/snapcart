import 'package:e_commerce/constants/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/blocs/cart/cart_cubit.dart';
import 'package:e_commerce/blocs/cart/cart_states.dart';
import '../services/cart_service.dart';
import '../widgets/slide_delete.dart';
import '../widgets/cart_total.dart';
import '../widgets/check_button.dart';
import '../widgets/promo_code.dart';
import '../widgets/sec_appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CartCubit(CartService())..fetchCart(),
        child: Padding(
          padding:
              EdgeInsets.all(MediaQuery.of(context).size.width * 0.5 * 0.1),
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        const SecAppbar(page: ''),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'My Cart',
                                style:
                                    AppTextStyles.header.copyWith(fontSize: 38),
                              ),
                            ),
                            Expanded(flex: 1, child: Container())
                          ],
                        )
                      ],
                    )),
                Expanded(
                  flex: 8,
                  child: BlocBuilder<CartCubit, CartStates>(
                    builder: (context, state) {
                      if (state is CartLoad) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is CartLoaded) {
                        final cartModel = state.cartModel;
                        return Column(
                          children: [
                            Expanded(
                              child:
                                  SlideToDelete(cartItems: cartModel.cartItems),
                            ),
                            CartTotal(
                                subTotal: cartModel.subTotal,
                                total: cartModel.total),
                          ],
                        );
                      } else if (state is CartError) {
                        return Center(child: Text(state.message));
                      }
                      return Container();
                    },
                  ),
                ),
                // Expanded(flex: 1, child: PromoCode()),
                Expanded(flex: 1, child: CheckOutButton()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
