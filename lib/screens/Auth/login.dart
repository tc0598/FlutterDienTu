import 'package:animate_do/animate_do.dart';
import 'package:app_shop_dien_tu/admin/dashboard.dart';
import 'package:app_shop_dien_tu/const.dart';
import 'package:app_shop_dien_tu/data/api.dart';
import 'package:app_shop_dien_tu/data/sharepre.dart';
import 'package:app_shop_dien_tu/screens/Detail/Product/forgotpass.dart';
import 'package:app_shop_dien_tu/screens/Detail/Product/register.dart';
import 'package:app_shop_dien_tu/screens/nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      // lấy token (lưu share_preference)
      String token = await APIRepository()
          .login(accountController.text, passwordController.text);
      var user = await APIRepository().current(token);
      // save share
      saveUser(user);
      if (token.isNotEmpty && accountController.text == '21dh111747') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DashBoard()));
        return;
      }
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const BottomNavBar()));
    }
  }

  @override
  void initState() {
    super.initState();
    // autoLogin();
  }

  autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user') != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const BottomNavBar()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.orange.shade900,
                Colors.orange.shade800,
                Colors.orange.shade400,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: CircleAvatar(
                            radius: 30, // Kích thước của vòng tròn
                            backgroundColor: Colors
                                .white, // Màu nền của vòng tròn, có thể thay đổi nếu muốn
                            child: ClipOval(
                              child: Image.asset(
                                "images/icon.png",
                                width: 40, // Kích thước của hình ảnh
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: const Text(
                            "SHOPSANDIENTU",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: const Text(
                          "Đăng nhập",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                      const SizedBox(height: 10),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1300),
                        child: const Text(
                          "Xin mời bạn đăng nhập ạ !",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 60),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1400),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200),
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller: accountController,
                                      decoration: const InputDecoration(
                                        hintText: "Tài khoản",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Vui lòng nhập tài khoản';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200),
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller: passwordController,
                                      obscureText: _obscureText,
                                      decoration: InputDecoration(
                                        hintText: "Mật khẩu",
                                        hintStyle:
                                            const TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscureText
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Vui lòng nhập mật khẩu';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1700),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Forgotpass()),
                                  );
                                },
                                child: const Text(
                                  'Quên mật khẩu',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1600),
                            child: MaterialButton(
                              onPressed: login,
                              height: 50,
                              color: Colors.orange[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Center(
                                child: Text(
                                  "Đăng nhập",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1700),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Register()),
                                );
                              },
                              child: const Text(
                                'Đăng kí',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1700),
                            child: const Text(
                              "Tiếp tục với",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: FadeInUp(
                                  duration: const Duration(milliseconds: 1800),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    height: 50,
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Facebook",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 30),
                              Expanded(
                                child: FadeInUp(
                                  duration: const Duration(milliseconds: 1900),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    height: 50,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    color: Colors.black,
                                    child: const Center(
                                      child: Text(
                                        "Github",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 30),
                              Expanded(
                                child: FadeInUp(
                                  duration: const Duration(milliseconds: 1800),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    height: 50,
                                    color: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Youtube",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
