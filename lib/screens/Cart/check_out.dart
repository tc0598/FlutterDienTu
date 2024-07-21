import 'dart:ffi' hide Size;
import 'dart:ui';
import 'package:app_shop_dien_tu/Provider/cart_provider.dart';
import 'package:app_shop_dien_tu/const.dart';
import 'package:app_shop_dien_tu/data/api.dart';
import 'package:app_shop_dien_tu/data/sqlite.dart';
import 'package:app_shop_dien_tu/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOutBox extends StatefulWidget {
  const CheckOutBox({super.key});

  @override
  State<CheckOutBox> createState() => CheckOutBoxState();
}

class CheckOutBoxState extends State<CheckOutBox> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final DatabaseHelper _databaseService = DatabaseHelper();
  dynamic tongReal = 10000;
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'vi_Vn');

  void updateTotal(dynamic totalUpdate) {
    setState(() {
      tongReal = totalUpdate;
    });
  }

  Future<void> total() async {
    List<Cart> items = await _databaseService.products();
    dynamic tong = 0;
    items.forEach((item) => tong += item.count * item.price);
    setState(() {
      tongReal = tong;
    });
  }

  @override
  void initState() {
    super.initState();
    total();
  }

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);

    return Container(
      height: 280,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                filled: true,
                fillColor: color1,
                hintText: "Nhập mã giảm giá",
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
                suffixIcon: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Áp dụng",
                    style: TextStyle(
                      color: color2,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tổng phụ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                // "\$${provider.totalPrice()}"
                formatCurrency.format(provider.totalPrice()),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tổng cộng",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                // "\$${provider.totalPrice()}"
                formatCurrency.format(tongReal),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              List<Cart> temp = await _databaseHelper.products();
              await APIRepository()
                  .addBill(temp, pref.getString('token').toString());
              _databaseHelper.clear();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: color2,
              minimumSize: const Size(500, 50),
            ),
            child: const Text(
              "Đặt hàng ",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
