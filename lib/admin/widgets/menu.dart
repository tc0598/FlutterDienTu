import 'package:app_shop_dien_tu/admin/model/menu_modal.dart';
import 'package:app_shop_dien_tu/admin/responsive.dart';
import 'package:app_shop_dien_tu/data/sharepre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Import các lớp và trang khác nếu cần

class Menu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const Menu({super.key, required this.scaffoldKey});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<MenuModel> menu = [
    MenuModel(icon: 'assets/svg/home.svg', title: "Trang chủ"),
    MenuModel(icon: 'assets/svg/profile.svg', title: "Danh mục sản phẩm"),
    MenuModel(icon: 'assets/svg/exercise.svg', title: "Sản phẩm"),
    MenuModel(icon: 'assets/svg/history.svg', title: "Lịch sử đơn hàng"),
    MenuModel(icon: 'assets/svg/signout.svg', title: "Đăng xuất"),
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.grey[800]!,
            width: 1,
          ),
        ),
        color: const Color(0xFF171821),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Responsive.isMobile(context) ? 40 : 80,
              ),
              for (var i = 0; i < menu.length; i++)
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                    color: selected == i
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selected = i;
                      });
                      widget.scaffoldKey.currentState!.closeDrawer();
                      if (menu[i].title == "Danh mục sản phẩm") {
                        Navigator.pushNamed(context, '/category-admin');
                      }else
                      if (menu[i].title == "Sản phẩm") {
                        Navigator.pushNamed(context, '/product-admin');
                      }else
                      if (menu[i].title == "Lịch sử đơn hàng"){
                        Navigator.pushNamed(context, '/history-admin');
                      }else
                      if (menu[i].title == "Đăng xuất"){
                        logOut(context);
                      }
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 7),
                          child: SvgPicture.asset(
                            menu[i].icon,
                            color: selected == i ? Colors.black : Colors.grey,
                          ),
                        ),
                        Text(
                          menu[i].title,
                          style: TextStyle(
                            fontSize: 16,
                            color: selected == i ? Colors.black : Colors.grey,
                            fontWeight: selected == i
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
