import 'dart:convert';

import 'package:app_shop_dien_tu/admin/pages/categories/category_add.dart';
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
  late Future<List<CategoryModel>> futureCategories;
  TextEditingController _searchController = TextEditingController();
  List<CategoryModel> filteredCategories = [];

  @override
  void initState() {
    super.initState();
    futureCategories = getCategories();
    _searchController.addListener(() {
      filterCategories();
    });
  }

  Future<List<CategoryModel>> getCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String strUser = prefs.getString('user')!;
    var user = User.fromJson(jsonDecode(strUser));
    var categoriesData = await APIRepository().getCategory(
        user.accountId ?? '21dh111747', prefs.getString('token').toString());
    return categoriesData
        .where((category) => category.name != 'Tất cả')
        .toList();
  }

  void filterCategories() async {
    final categories = await futureCategories;
    setState(() {
      filteredCategories = categories
          .where((category) => category.name
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  Future<void> deleteCategory(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await APIRepository().removeCategory(
      id,
      prefs.getString('accountID').toString(),
      prefs.getString('token').toString(),
    );
    setState(() {
      futureCategories = getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quản lý danh mục sản phẩm',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Color(0xFF21222D),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                labelText: 'Search Categories',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<CategoryModel>>(
              future: futureCategories,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No categories found.'),
                  );
                }

                final categories = filteredCategories.isNotEmpty
                    ? filteredCategories
                    : snapshot.data!;

                return ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(12),
                        leading: category.imageUrl.isNotEmpty
                            ? Image.network(
                                category.imageUrl,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              )
                            : SizedBox(width: 50, height: 50), // Placeholder if no image
                        title: Text(category.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.mode_edit, color: Colors.blue),
                              onPressed: () {
                                Navigator.of(context)
                                    .push(
                                      MaterialPageRoute(
                                        builder: (_) => CategoryAdd(
                                          isUpdate: true,
                                          categoryModel: category,
                                        ),
                                        fullscreenDialog: true,
                                      ),
                                    )
                                    .then((_) => setState(() {
                                          futureCategories = getCategories();
                                        }));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete_outline, color: Colors.red),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Xác nhận xóa danh mục !',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                    content: Text(
                                        'Bạn có chắc muốn xóa danh mục sản phẩm này ?',style: TextStyle(fontSize: 15),),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Hủy',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await deleteCategory(category.id);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Xóa',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18),),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (_) => const CategoryAdd(),
                  fullscreenDialog: true,
                ),
              )
              .then((_) => setState(() {
                    futureCategories = getCategories();
                  }));
        },
        tooltip: 'Thêm danh mục sản phẩm',
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF21222D), Colors.lightBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
