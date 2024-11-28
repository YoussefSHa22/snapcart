import 'package:e_commerce/constants/font_constants.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryColor),
      child: Center(
        child: Padding(
          padding:
              EdgeInsets.all(MediaQuery.of(context).size.height * 0.2 * 0.1),
          child: Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Text(
                    'Proceed to Checkout',
                    style: AppTextStyles.header
                        .copyWith(fontSize: 20, color: AppColors.secondryColor),
                  )),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.secondryColor),
                  child: Center(
                      child: Image.asset(
                    'assets/images/icon (10).png',
                   
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
