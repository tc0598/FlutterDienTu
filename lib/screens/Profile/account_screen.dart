import 'dart:convert';
import 'package:app_shop_dien_tu/const.dart';
import 'package:app_shop_dien_tu/data/sharepre.dart';
import 'package:app_shop_dien_tu/models/user.dart';
import 'package:app_shop_dien_tu/screens/History/history_screen.dart';
import 'package:app_shop_dien_tu/screens/Profile/Widget/forward_button.dart';
import 'package:app_shop_dien_tu/screens/Profile/Widget/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  User user = User.userEmpty();

  Future<void> getDataUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String strUser = pref.getString('user')!;
    user = User.fromJson(jsonDecode(strUser));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text(
          "Tài khoản",
          style: TextStyle(
              color: color2, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: user.imageURL != null &&
                            user.imageURL!.isNotEmpty
                        ? NetworkImage(user.imageURL!)
                        : AssetImage('images/profile3.png') as ImageProvider,
                    radius: 40,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CCCD: ${user.idNumber}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Tên: ${user.fullName}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Số điện thoại: ${user.phoneNumber}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Giới tính: ${user.gender}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Ngày sinh: ${user.birthDay}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Năm học: ${user.schoolYear}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Khóa học: ${user.schoolKey}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Ngày tạo: ${user.dateCreated}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Setting Items
            SettingItem(
              title: "Lịch sử đơn hàng",
              icon: Icons.shopping_cart,
              bgColor: Colors.green.shade100,
              iconColor: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            SettingItem(
              title: "Vị trí của tôi",
              icon: Icons.location_on,
              bgColor: Colors.blue.shade100,
              iconColor: Colors.blue,
              onTap: () {},
            ),
            const SizedBox(height: 20),
            SettingItem(
              title: "Đăng xuất",
              icon: Icons.logout,
              bgColor: Colors.red.shade100,
              iconColor: Colors.redAccent,
              onTap: () {
                logOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
