import 'package:e_commerce/constants/font_constants.dart';
import 'package:flutter/material.dart';

class CartTotal extends StatelessWidget {
  final double subTotal;
  final double total;

  const CartTotal({super.key, required this.subTotal, required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Total (3 items) :',
            style: AppTextStyles.subheader.copyWith(fontSize: 20),
          ),
          Spacer(),
          Text('EGP $total', style: AppTextStyles.header.copyWith(fontSize: 23))
        ],
      ),
    );
  }
}
