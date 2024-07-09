import 'package:app_shop_dien_tu/const.dart';
import 'package:app_shop_dien_tu/screens/Profile/Widget/forward_button.dart';
import 'package:app_shop_dien_tu/screens/Profile/Widget/setting_item.dart';
import 'package:app_shop_dien_tu/screens/Profile/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text(
          "Tài khoản", 
          style: TextStyle(
            color: color2,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
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
                  Image.asset("images/profile.jpg", width: 70, height: 70),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nguyễn Thành Công",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "HUFLIT",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  ForwardButton(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const EditAccountScreen()));
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
              onTap: () {},
            ),        
          ],
        ),
      ),
    );
  }
}
