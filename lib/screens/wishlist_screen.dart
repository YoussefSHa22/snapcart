// import 'package:e_commerce/blocs/wishlist/wishlist_cubit.dart';
// import 'package:e_commerce/blocs/wishlist/wishlist_states.dart';
// import 'package:e_commerce/widgets/wishlist_items.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../constants/font_constants.dart';

// class Wishlist extends StatelessWidget {
//   const Wishlist({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.5 * 0.08),
//       child: Column(
//         children: [
//           Expanded(
//             child: Column(
//               children: [
//                 Text('My Wishlist', style: AppTextStyles.header),
//                 Expanded(
//                   child: BlocBuilder<WishlistCubit, WishlistStates>(
//                     builder: (context, state) {
//                       if (state is WishlistLoading) {
//                         return const Center(child: CircularProgressIndicator());
//                       } else if (state is WishlistLoaded) {
//                         return WishlistItems(
//                             wishlistItems: state.wishlistItems);
//                       } else if (state is WishlistError) {
//                         return Center(child: Text(state.message));
//                       }
//                       return Container();
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:e_commerce/blocs/wishlist/wishlist_cubit.dart';
import 'package:e_commerce/blocs/wishlist/wishlist_states.dart';
import 'package:e_commerce/widgets/wishlist_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/font_constants.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.5 * 0.08),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Text('My Wishlist', style: AppTextStyles.header),
                Expanded(
                  child: BlocBuilder<WishlistCubit, WishlistStates>(
                    builder: (context, state) {
                      if (state is WishlistLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is WishlistLoaded) {
                        return WishlistItems(
                          wishlistItems: state.wishlistItems,
                        );
                      } else if (state is WishlistError) {
                        return Center(child: Text(state.message));
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
