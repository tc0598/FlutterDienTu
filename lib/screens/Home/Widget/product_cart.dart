import 'package:app_shop_dien_tu/const.dart';
import 'package:app_shop_dien_tu/models/product_model.dart';
import 'package:app_shop_dien_tu/screens/Detail/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductCart extends StatelessWidget {
  final Product product;
  const ProductCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'vi_VN');
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(product: product)));
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Center(
                  child: Hero(
                    tag: product.image,
                    child: Image.asset(
                      product.image,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        formatCurrency.format(product.price),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: List.generate(
                            product.colors.length,
                            (index) => Container(
                                  width: 18,
                                  height: 18,
                                  margin: const EdgeInsets.only(right: 4),
                                  decoration: BoxDecoration(
                                    color: product.colors[index],
                                    shape: BoxShape.circle,
                                  ),
                                )),
                      )
                    ])
              ],
            ),
          ),
          Positioned(
              child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: color2,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(10)
                ),
              ),
              child: GestureDetector(onTap: () {},
              child: const Icon(Icons.favorite_border,color: Colors.white,size: 22,),),
            ),
          ))
        ],
      ),
    );
  }
}
