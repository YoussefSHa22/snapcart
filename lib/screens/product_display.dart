import 'package:e_commerce/constants/color_constants.dart';
import 'package:e_commerce/constants/font_constants.dart';
import 'package:flutter/material.dart';

import '../models/products_model.dart';
import '../widgets/add_cart.dart';
import '../widgets/image_slider.dart';
import '../widgets/product_disc.dart';
import '../widgets/sec_appbar.dart';

class ProductDisplay extends StatelessWidget {
  final ProductsModel product;
  const ProductDisplay({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondryColor,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ImageSlider(
                product: product,
              ),
            ),
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SecAppbar(page: ''),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.44, //0.44
              left: 0,
              right: 0,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: ProductDiscription(
                            product: product,
                          )),
                      Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Price',
                                    style: AppTextStyles.subheader
                                        .copyWith(fontSize: 13),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 1.0),
                                    child: Text(
                                      "${product.oldprice}",
                                      style: AppTextStyles.subheader.copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 13),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text('EGP',
                                          style: AppTextStyles.subheader
                                              .copyWith(fontSize: 13)),
                                      Text("${product.price}",
                                          style: AppTextStyles.header
                                              .copyWith(fontSize: 23)),
                                    ],
                                  ),
                                ],
                              ),
                              AddCartButton(
                                product: product,
                              )
                            ],
                          ))
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
