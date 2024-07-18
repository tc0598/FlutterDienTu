import 'dart:convert';

import 'package:app_shop_dien_tu/data/api.dart';
import 'package:app_shop_dien_tu/models/category.dart';
import 'package:app_shop_dien_tu/models/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryAdminScreen extends StatefulWidget {
  @override
  _CategoryAdminScreenState createState() => _CategoryAdminScreenState();
}

class _CategoryAdminScreenState extends State<CategoryAdminScreen> {
    int selectedIndex = 0;

  late Future<List<CategoryModel>> _categoriesFuture;
  late List<CategoryModel> _categoriesTest = [];

  @override
  void initState() {
    super.initState();
    _categoriesFuture = getCategories();
    fetchAndUseCategories();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Admin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
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
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: selectedIndex == index
                            ? Color.fromARGB(255, 255, 211, 167)
                            : Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                _categoriesTest[index].imageUrl,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(height: 5),
                          Text(
                            _categoriesTest[index].name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _categoriesTest.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_categoriesTest[index].name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Chỉnh sửa danh mục ở đây
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Xóa danh mục ở đây
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
