import 'package:animate_do/animate_do.dart';
import 'package:app_shop_dien_tu/data/api.dart';
import 'package:app_shop_dien_tu/models/register.dart';
import 'package:app_shop_dien_tu/screens/Auth/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int _gender = 0;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _numberIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _schoolKeyController = TextEditingController();
  final TextEditingController _schoolYearController = TextEditingController();
  final TextEditingController _birthDayController = TextEditingController();
  final TextEditingController _imageURL = TextEditingController();
  String gendername = 'None';
  String temp = '';

  Future<String> register() async {
    return await APIRepository().register(Signup(
        accountID: _accountController.text,
        birthDay: _birthDayController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
        fullName: _fullNameController.text,
        phoneNumber: _phoneNumberController.text,
        schoolKey: _schoolKeyController.text,
        schoolYear: _schoolYearController.text,
        gender: getGender(),
        imageUrl: _imageURL.text,
        numberID: _numberIDController.text));
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String response = await register();
      if (response == "123") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const LoginScreen()));
      } else {
        print(response);
      }
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
                const SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: const Text(
                          "Đăng Kí",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                      const SizedBox(height: 10),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1300),
                        child: const Text(
                          "Tạo cho mình 1 tài khoản nhé !",
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
                                  _buildTextField(
                                    controller: _accountController,
                                    hintText: "Mã số sinh viên",
                                    prefixIcon: Icons.account_circle,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập mã số sinh viên';
                                      }
                                      return null;
                                    },
                                  ),
                                  _buildTextField(
                                    controller: _passwordController,
                                    hintText: "Mật khẩu",
                                    prefixIcon: Icons.lock,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập mật khẩu';
                                      }
                                      return null;
                                    },
                                  ),
                                  _buildTextField(
                                    controller: _confirmPasswordController,
                                    hintText: "Nhập lại mật khẩu",
                                    prefixIcon: Icons.lock_outline,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập lại mật khẩu';
                                      }
                                      if (value != _passwordController.text) {
                                        return 'Mật khẩu không khớp';
                                      }
                                      return null;
                                    },
                                  ),
                                  _buildTextField(
                                    controller: _fullNameController,
                                    hintText: "Tên đầy đủ",
                                    prefixIcon: Icons.person,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập tên đầy đủ';
                                      }
                                      return null;
                                    },
                                  ),
                                  _buildTextField(
                                    controller: _numberIDController,
                                    hintText: "Chứng minh nhân dân",
                                    prefixIcon: Icons.credit_card,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập chứng minh nhân dân';
                                      }
                                      return null;
                                    },
                                  ),
                                  _buildTextField(
                                    controller: _phoneNumberController,
                                    hintText: "Số điện thoại",
                                    prefixIcon: Icons.phone,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập số điện thoại';
                                      }
                                      return null;
                                    },
                                  ),
                                  _buildTextField(
                                    controller: _birthDayController,
                                    hintText: "Ngày sinh",
                                    prefixIcon: Icons.cake,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập ngày sinh';
                                      }
                                      return null;
                                    },
                                  ),
                                  _buildTextField(
                                    controller: _schoolYearController,
                                    hintText: "Năm học",
                                    prefixIcon: Icons.school,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập năm học';
                                      }
                                      return null;
                                    },
                                  ),
                                  _buildTextField(
                                    controller: _schoolKeyController,
                                    hintText: "Khóa học",
                                    prefixIcon: Icons.key,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập khóa học';
                                      }
                                      return null;
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(21),
                                    child: TextFormField(
                                      controller: _imageURL,
                                      decoration: const InputDecoration(
                                        labelText: "Hình ảnh URL",
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                        icon: Icon(Icons.image, color: Colors.orange),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Vui lòng nhập hình ảnh URL';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(21),
                                    child: Row(
                                      children: [
                                        Icon(Icons.people, color: Colors.orange),
                                        SizedBox(width: 11),
                                        Text(
                                          "Giới tính",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: ListTile(
                                          contentPadding: const EdgeInsets.all(0),
                                          title: const Text("Nam"),
                                          dense: true,
                                          leading: Transform.translate(
                                              offset: const Offset(16, 0),
                                              child: Radio<int>(
                                                value: 1,
                                                groupValue: _gender,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _gender = value!;
                                                  });
                                                },
                                              )),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                            contentPadding: const EdgeInsets.all(0),
                                            title: const Text("Nữ"),
                                            dense: true,
                                            leading: Transform.translate(
                                              offset: const Offset(16, 0),
                                              child: Radio<int>(
                                                value: 2,
                                                groupValue: _gender,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _gender = value!;
                                                  });
                                                },
                                              ),
                                            )),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                            contentPadding: const EdgeInsets.all(0),
                                            title: const Text("Khác"),
                                            dense: true,
                                            leading: Transform.translate(
                                              offset: const Offset(16, 0),
                                              child: Radio<int>(
                                                value: 3,
                                                groupValue: _gender,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _gender = value!;
                                                  });
                                                },
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1600),
                            child: MaterialButton(
                              onPressed: _submitForm,
                              height: 50,
                              color: Colors.orange[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Center(
                                child: Text(
                                  "Đăng kí",
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
                                      builder: (context) => const LoginScreen()),
                                );
                              },
                              child: const Text(
                                'Đăng nhập',
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
                              SizedBox(width: 30),
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

  getGender() {
    if (_gender == 1) {
      return "Nam";
    } else if (_gender == 2) {
      return "Nữ";
    }
    return "Khác";
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    bool obscureText = false,
    required FormFieldValidator<String> validator,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          prefixIcon: Icon(prefixIcon, color: Colors.orange),
        ),
        validator: validator,
      ),
    );
  }
}
