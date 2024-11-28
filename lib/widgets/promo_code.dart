import 'package:e_commerce/constants/color_constants.dart';
import 'package:e_commerce/constants/font_constants.dart';
import 'package:flutter/material.dart';

class PromoCode extends StatelessWidget {
  const PromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.subColor),
      child: Center(
        child: Padding(
          padding:
              EdgeInsets.all(MediaQuery.of(context).size.height * 0.2 * 0.1),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Promo Code', border: InputBorder.none),
                  )),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.primaryColor),
                  child: Center(
                    child: Text(
                      'Apply',
                      style: AppTextStyles.header.copyWith(
                          color: AppColors.secondryColor, fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
