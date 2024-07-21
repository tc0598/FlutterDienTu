import 'dart:convert';
import 'package:app_shop_dien_tu/data/api.dart';
import 'package:app_shop_dien_tu/data/sqlite.dart';
import 'package:app_shop_dien_tu/models/cart.dart';
import 'package:app_shop_dien_tu/models/product_model.dart';
import 'package:app_shop_dien_tu/models/user.dart';
import 'package:app_shop_dien_tu/screens/Home/Widget/home_app_bar.dart';
import 'package:app_shop_dien_tu/screens/Home/Widget/product_cart.dart';
import 'package:app_shop_dien_tu/screens/Home/Widget/search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;
  late Future<List<CategoryModel>> _categoriesFuture;
  late List<CategoryModel> _categoriesTest = [];
  late List<Product> _products = [];
  late List<Product> _phones = [];
  late List<Product> _laptop = [];
  late List<Product> _watch = [];
  late List<Product> _headphones = [];
  late List<Product> _televisions = [];
  late List<Product> _tulanh = [];

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

  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategories = [
      _products,
      _phones,
      _laptop,
      _watch,
      _headphones,
      _televisions,
      _tulanh,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const CustomAppBar(),
              const SizedBox(height: 20),
              const MySearchBar(),
              const SizedBox(height: 20),
              _buildCarouselBanner(),
              const SizedBox(height: 20),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categoriesTest.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedIndex == index
                              ? Color.fromARGB(255, 255, 211, 167)
                              : Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                _categoriesTest[index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              _categoriesTest[index].name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sản phẩm nổi bật",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle view all action
                    },
                    child: Text(
                      "Xem tất cả",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: selectedCategories[selectedIndex].length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              '${selectedCategories[selectedIndex][index].name} added to cart.'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    child: ProductCart(
                      product: selectedCategories[selectedIndex][index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselBanner() {
    final List<String> imageList = [
      'https://cdn.nguyenkimmall.com/images/detailed/691/iphone-12-chinh-thuc-mo-ban-iphone-12-pro-max-len-ngoi-thumbnail.jpg',
      'https://cdn.dribbble.com/userupload/8799534/file/original-d7c202ba2a2b95667557864e88109d4d.png?resize=752x',
      'https://samnec.com.vn/uploads/images/122020/sony-tv.jpg',
    ];
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
      ),
      items: imageList
          .map((item) => Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
