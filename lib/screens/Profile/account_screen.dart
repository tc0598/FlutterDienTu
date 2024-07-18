import 'dart:convert';

import 'package:app_shop_dien_tu/const.dart';
import 'package:app_shop_dien_tu/data/sharepre.dart';
import 'package:app_shop_dien_tu/models/user.dart';
import 'package:app_shop_dien_tu/screens/Profile/Widget/forward_button.dart';
import 'package:app_shop_dien_tu/screens/Profile/Widget/setting_item.dart';
import 'package:app_shop_dien_tu/screens/Profile/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // khi dùng tham số truyền vào phải khai báo biến trùng tên require
  User user = User.userEmpty();
  getDataUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String strUser = pref.getString('user')!;

    user = User.fromJson(jsonDecode(strUser));
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
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
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: user.imageURL != null && user.imageURL!.isNotEmpty ? NetworkImage(user.imageURL!): AssetImage('images/profile3.png') as ImageProvider,
                    radius: 40,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CCCD: ${user.idNumber}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Tên: ${user.fullName}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // Text(
                      //   "Số điện thoại: ${user.phoneNumber}",
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      // Text(
                      //   "Giới tính: ${user.gender}",
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      // Text(
                      //   "Ngày sinh: ${user.birthDay}",
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      const SizedBox(height: 15),
                      Text(
                        "Năm học: ${user.schoolYear}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),

                      Text(
                        "Khóa học: ${user.schoolKey}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Ngày tạo: ${user.dateCreated}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ForwardButton(onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditAccountScreen()));
                  }),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SettingItem(
              title: "Lịch sử đơn hàng",
              icon: Icons.shopping_cart,
              bgColor: Colors.green.shade100,
              iconColor: Colors.green,
              onTap: () {},
            ),
            const SizedBox(height: 30),
            SettingItem(
              title: "Vị trí của tôi",
              icon: Icons.location_on,
              bgColor: Colors.blue.shade100,
              iconColor: Colors.blue,
              onTap: () {},
            ),
            const SizedBox(height: 30),
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
