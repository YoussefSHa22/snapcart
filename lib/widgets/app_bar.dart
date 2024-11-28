import 'package:e_commerce/constants/color_constants.dart';
import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.subColor,
            child: Icon(
              Icons.settings,
              color: Colors.black,
              size: 30,
            ))
      ],
    );
  }
}
