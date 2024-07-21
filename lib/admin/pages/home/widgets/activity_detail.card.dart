import 'dart:convert';

import 'package:app_shop_dien_tu/admin/model/health_model.dart';
import 'package:app_shop_dien_tu/admin/responsive.dart';
import 'package:app_shop_dien_tu/admin/widgets/custom_card.dart';
import 'package:app_shop_dien_tu/data/api.dart';
import 'package:app_shop_dien_tu/models/category.dart';
import 'package:app_shop_dien_tu/models/product_model.dart';
import 'package:app_shop_dien_tu/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivityDetailsCard extends StatefulWidget {
  const ActivityDetailsCard({super.key});

  @override
  State<ActivityDetailsCard> createState() => _ActivityDetailsCardState();
}

class _ActivityDetailsCardState extends State<ActivityDetailsCard> {
  late Future<List<CategoryModel>> _categoriesFuture;
  late List<CategoryModel> _categoriesTest = [];
  late List<Product> _products = [];
  late List<Product> _phones = [];
  late List<Product> _laptop = [];
  late List<Product> _watch = [];
  late List<Product> _headphones = [];
  late List<Product> _televisions = [];
  late List<Product> _tulanh = [];
  late List<HealthModel> healthDetails = [];

  @override
  void initState() {
    super.initState();
    _categoriesFuture = getCategories();
    fetchAndUseCategories();
    getProducts();
  }

  Future<List<CategoryModel>> getCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String strUser = prefs.getString('user')!;
    var user = User.fromJson(jsonDecode(strUser));
    var categories = await APIRepository().getCategory(
        user.accountId ?? '21dh111747', prefs.getString('token').toString());
    print('ID::' + user.accountId.toString());
    print('Token::' + prefs.getString('token').toString());

    return categories;
  }

  Future<void> fetchAndUseCategories() async {
    try {
      List<CategoryModel> categories = await _categoriesFuture;
      setState(() {
        _categoriesTest = categories;
      });
      print('Number of categories: ${_categoriesTest.length}');
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String strUser = prefs.getString('user')!;
    var user = User.fromJson(jsonDecode(strUser));
    var products = await APIRepository().getProduct(
        user.accountId ?? '21dh111747', prefs.getString('token').toString());
    try {
      setState(() {
        _products = products;
        _phones = products.where((phone) => phone.categoryID == 3536).toList();
        _laptop =
            products.where((laptop) => laptop.categoryID == 3537).toList();
        _watch = products.where((watch) => watch.categoryID == 3538).toList();
        _headphones = products
            .where((headphones) => headphones.categoryID == 3539)
            .toList();
        _televisions = products
            .where((televisions) => televisions.categoryID == 3540)
            .toList();
        _tulanh =
            products.where((tulanh) => tulanh.categoryID == 4042).toList();
        healthDetails = [
          HealthModel(
              icon: 'assets/svg/burn.svg',
              value: _products.length.toString(),
              title: "Số lượng sản phẩm"),
          HealthModel(
              icon: 'assets/svg/steps.svg',
              value: _categoriesTest.length.toString(),
              title: "Số lượng danh mục sản phẩm"),
        ];
      });
      print('Number of phones: ${_phones.length}');
      print('Number of laptop: ${_laptop.length}');
      print('Number of watch: ${_watch.length}');
      print('Number of headphones: ${_headphones.length}');
      print('Number of televisions: ${_televisions.length}');
    } catch (e) {
      print('Error: $e');
    }
  }

  // final List<HealthModel> healthDetails = const [
  //   HealthModel(
  //       icon: 'assets/svg/burn.svg', value: _products, title: "Số lượng sản phẩm"),
  //   HealthModel(icon: 'assets/svg/steps.svg', value: "10,983", title: "Số bước đi"),
  //   HealthModel(
  //       icon: 'assets/svg/distance.svg', value: "7km", title: "Khoảng cách"),
  //   HealthModel(icon: 'assets/svg/sleep.svg', value: "7h48m", title: "Ngủ"),
  // ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: healthDetails.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
          mainAxisSpacing: 12.0),
      itemBuilder: (context, i) {
        return CustomCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(healthDetails[i].icon),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 4),
                child: Text(
                  healthDetails[i].value,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                healthDetails[i].title,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        );
      },
    );
  }
}
