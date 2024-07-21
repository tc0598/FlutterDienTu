// import 'package:app_shop_dien_tu/data/api.dart';
// import 'package:app_shop_dien_tu/models/user.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class EditAccountScreen extends StatefulWidget {
//   final User user;

//   const EditAccountScreen({super.key, required this.user});

//   @override
//   State<EditAccountScreen> createState() => _EditAccountScreenState();
// }

// class _EditAccountScreenState extends State<EditAccountScreen> {
//   final _formKey = GlobalKey<FormState>();

//   late TextEditingController _idNumberController;
//   late TextEditingController _fullNameController;
//   late TextEditingController _phoneNumberController;
//   late TextEditingController _genderController;
//   late TextEditingController _birthDayController;
//   late TextEditingController _schoolYearController;
//   late TextEditingController _schoolKeyController;

//   @override
//   void initState() {
//     super.initState();
//     _idNumberController = TextEditingController(text: widget.user.idNumber);
//     _fullNameController = TextEditingController(text: widget.user.fullName);
//     _phoneNumberController = TextEditingController(text: widget.user.phoneNumber);
//     _genderController = TextEditingController(text: widget.user.gender);
//     _birthDayController = TextEditingController(text: widget.user.birthDay);
//     _schoolYearController = TextEditingController(text: widget.user.schoolYear);
//     _schoolKeyController = TextEditingController(text: widget.user.schoolKey);
//   }

//   @override
//   void dispose() {
//     _idNumberController.dispose();
//     _fullNameController.dispose();
//     _phoneNumberController.dispose();
//     _genderController.dispose();
//     _birthDayController.dispose();
//     _schoolYearController.dispose();
//     _schoolKeyController.dispose();
//     super.dispose();
//   }

// void _saveChanges() async {
//   if (_formKey.currentState!.validate()) {

//     User updatedUser = User(
//       idNumber: _idNumberController.text,
//       accountId: widget.user.accountId, 
//       fullName: _fullNameController.text,
//       phoneNumber: _phoneNumberController.text,
//       imageURL: widget.user.imageURL, 
//       birthDay: _birthDayController.text,
//       gender: _genderController.text,
//       schoolYear: _schoolYearController.text,
//       schoolKey: _schoolKeyController.text,
//       dateCreated: widget.user.dateCreated, 
//       status: widget.user.status, 
//     );

//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String token = prefs.getString('token') ?? '';

//     bool success = await APIRepository().updateUser(updatedUser, token);

//     if (success) {
//       Navigator.pop(context);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Cập nhật thông tin không thành công')),
//       );
//     }
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chỉnh sửa thông tin'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _idNumberController,
//                 decoration: const InputDecoration(labelText: 'Số CCCD'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Vui lòng nhập số CCCD';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _fullNameController,
//                 decoration: const InputDecoration(labelText: 'Họ và tên'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Vui lòng nhập họ và tên';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _phoneNumberController,
//                 decoration: const InputDecoration(labelText: 'Số điện thoại'),
//                 keyboardType: TextInputType.phone,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Vui lòng nhập số điện thoại';
//                   }
//                   final phoneRegExp = RegExp(r'^\d{10,15}$');
//                   if (!phoneRegExp.hasMatch(value)) {
//                     return 'Số điện thoại không hợp lệ';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _genderController,
//                 decoration: const InputDecoration(labelText: 'Giới tính'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Vui lòng nhập giới tính';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _birthDayController,
//                 decoration: const InputDecoration(labelText: 'Ngày sinh'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Vui lòng nhập ngày sinh';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _schoolYearController,
//                 decoration: const InputDecoration(labelText: 'Năm học'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Vui lòng nhập năm học';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _schoolKeyController,
//                 decoration: const InputDecoration(labelText: 'Khóa học'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Vui lòng nhập khóa học';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 32),
//               ElevatedButton(
//                 onPressed: _saveChanges,
//                 child: const Text('Lưu thay đổi'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
