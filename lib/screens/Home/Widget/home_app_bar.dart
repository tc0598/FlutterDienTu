import 'package:app_shop_dien_tu/const.dart';
import 'package:app_shop_dien_tu/screens/Cart/cart_screen.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: color1,
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () {},
          icon: Image.asset(
            "images/icon.png",
            height: 25,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
