import 'package:e_commerce/constants/font_constants.dart';
import 'package:e_commerce/widgets/product_counter.dart';
import 'package:flutter/material.dart';

import '../models/products_model.dart';

class ProductDiscription extends StatelessWidget {
  final ProductsModel product;
  const ProductDiscription({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.07 * 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name.split(' ').take(3).join(' '),
                    style: AppTextStyles.header.copyWith(fontSize: 25),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical:
                            MediaQuery.of(context).size.height * 0.07 * 0.1),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        product.name.split(' ').skip(3).join(' '),
                        style: AppTextStyles.subheader.copyWith(fontSize: 12),
                        softWrap: true,
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              ProductCounter()
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.07 * 0.3),
            child: Text(
              'Description',
              style: AppTextStyles.header.copyWith(fontSize: 25),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
            child: SingleChildScrollView(
              child: Text(
                product.description,
                style: AppTextStyles.subheader
                    .copyWith(fontSize: 12, wordSpacing: 0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
