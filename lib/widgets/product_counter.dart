import 'package:e_commerce/constants/color_constants.dart';
import 'package:e_commerce/constants/font_constants.dart';
import 'package:flutter/material.dart';

class ProductCounter extends StatelessWidget {
  const ProductCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height * 0.07 * 1.4,
      height: MediaQuery.of(context).size.height * 0.07 * 0.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.subColor),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                child: Text(
              '-',
              style: AppTextStyles.header
                  .copyWith(fontSize: 25, fontWeight: FontWeight.normal),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '1',
                style: AppTextStyles.header
                    .copyWith(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
            InkWell(
                child: Text(
              '+',
              style: AppTextStyles.header
                  .copyWith(fontSize: 20, fontWeight: FontWeight.normal),
            )),
          ],
        ),
      ),
    );
  }
}
