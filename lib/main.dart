import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce/constants/color_constants.dart';
import 'package:e_commerce/screens/cart_screen.dart';
import 'package:e_commerce/screens/home_screen.dart';
import 'package:e_commerce/screens/log_in.dart';
import 'package:e_commerce/screens/product_display.dart';
import 'package:e_commerce/screens/profile_screen.dart';
import 'package:e_commerce/screens/register.dart';
import 'package:e_commerce/screens/search_screen.dart';
import 'package:e_commerce/screens/wishlist_screen.dart';
import 'package:e_commerce/services/auth_service.dart';
import 'package:e_commerce/services/banner_service.dart';
import 'package:e_commerce/services/cart_service.dart';
import 'package:e_commerce/services/products_service.dart';
import 'package:e_commerce/services/wishlist_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'blocs/authorization/auth_cubit.dart';
import 'blocs/banners/banners_cubit.dart';
import 'blocs/cart/cart_cubit.dart';
import 'blocs/products/products_cubit.dart';
import 'blocs/profile/profile_cubits.dart';
import 'blocs/search/search_cubit.dart';
import 'blocs/wishlist/wishlist_cubit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _pageindex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const WishlistScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SearchCubit(ProductService())),
          BlocProvider(
              create: (context) => ProfileCubit(AuthService())..fetchProfile()),
          BlocProvider(
            create: (context) =>
                ProductsCubit(ProductService())..fetchProducts(),
          ),
          BlocProvider(
            create: (context) => BannerCubit(BannerService())..fetchBanners(),
          ),
          BlocProvider(
            create: (context) => CartCubit(CartService())..fetchCart(),
          ),
          BlocProvider( 
            create: (context) => AuthCubit(AuthService()),
          ),
          BlocProvider(
            create: (context) =>
                WishlistCubit(WishlistService())..fetchWishlist(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SafeArea(
                child: Scaffold(
              bottomNavigationBar: CurvedNavigationBar(
                  backgroundColor: Colors.white,
                  buttonBackgroundColor: AppColors.primaryColor,
                  color: AppColors.primaryColor,
                  onTap: (i) {
                    setState(() {
                      _pageindex = i;
                    });
                  },
                  items: [
                    const Icon(
                      Icons.home,
                      color: AppColors.secondryColor,
                      size: 30,
                    ),
                    const Icon(
                      Icons.search,
                      color: AppColors.secondryColor,
                      size: 30,
                    ),
                    Image.asset(
                      'assets/images/Frame (1).png',
                      color: AppColors.secondryColor,
                      height: 30,
                      width: 30,
                    ),
                    Image.asset(
                      'assets/images/Frame.png',
                      color: AppColors.secondryColor,
                      height: 30,
                      width: 30,
                    ),
                  ]),
              body: _screens[_pageindex],

              // body: LogIn(),
            ))));
  }
}
