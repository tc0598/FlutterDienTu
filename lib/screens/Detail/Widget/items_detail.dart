import 'package:app_shop_dien_tu/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemsDetail extends StatelessWidget {
  final Product product;
  const ItemsDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'vi_VN');
    return Column(
      children: [
        Column(
          children: [
            Text(
              product.name,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 25,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            Text(
              "\$${product.price}",
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 25,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}