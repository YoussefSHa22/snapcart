import 'package:e_commerce/blocs/profile/profile_cubits.dart';
import 'package:e_commerce/blocs/profile/profile_states.dart';
import 'package:e_commerce/constants/color_constants.dart';
import 'package:e_commerce/constants/font_constants.dart';
import 'package:e_commerce/screens/all_items.dart';

import 'package:e_commerce/widgets/sec_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/banner_widget.dart';
import '../widgets/product_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Expanded(flex: 1, child: SecAppbar(page: 'home')),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hello,',
                          style: AppTextStyles.header,
                        ),
                        BlocBuilder<ProfileCubit, ProfileState>(
                          builder: (context, state) {
                            if (state is ProfileLoaded) {
                              return Text(
                                state.user.name,
                                style: AppTextStyles.subheader,
                              );
                            } else if (state is ProfileLoading) {
                              return const Text(
                                'Loading...',
                                style: AppTextStyles.subheader,
                              );
                            } else {
                              return const Text(
                                'User',
                                style: AppTextStyles.subheader,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: Container())
                ],
              ),
            ),
            const Expanded(flex: 3, child: BannerWidget()),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'New Arrivals',
                          style: AppTextStyles.header.copyWith(fontSize: 25),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AllProductsScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'View All',
                            style: AppTextStyles.subheader.copyWith(
                                fontSize: 17, color: AppColors.primaryColor),
                          ),
                        ),
                      ],
                    ),
                    const ProductsSlider()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
