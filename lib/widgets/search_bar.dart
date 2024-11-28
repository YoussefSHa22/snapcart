import 'package:e_commerce/constants/color_constants.dart';
import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      backgroundColor:
          MaterialStateColor.resolveWith((states) => AppColors.subColor),
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 5),
        child: Image.asset('assets/images/icon (1).png'),
      ),
      hintText: 'Search...',
    );
  }
}
