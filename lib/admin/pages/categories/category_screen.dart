import 'dart:convert';
import 'package:app_shop_dien_tu/admin/pages/categories/widget/create_category.dart';
import 'package:app_shop_dien_tu/admin/pages/categories/widget/update_category.dart';
import 'package:app_shop_dien_tu/data/api.dart';
import 'package:app_shop_dien_tu/models/category.dart';
import 'package:app_shop_dien_tu/models/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryAdminScreen extends StatefulWidget {
  @override
  State<CategoryAdminScreen> createState() => _CategoryAdminScreenState();
}

class _CategoryAdminScreenState extends State<CategoryAdminScreen> {
    late Future<List<CategoryModel>> _categoriesFuture;
  late List<CategoryModel> _categoriesTest = [];
    @override
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
      body: ListView(
        children: List.generate(10, (index) {
          return ListTile(
            title: Text('Category $index'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateCategoryScreen()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                ),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateCategoryScreen()),
          );
        },
      ),
    );
  }
}
