import 'package:app_shop_dien_tu/models/bill.dart';
import 'package:app_shop_dien_tu/models/cart.dart';
import 'package:app_shop_dien_tu/models/category.dart';
import 'package:app_shop_dien_tu/models/forgotpassword.dart';
import 'package:app_shop_dien_tu/models/product_model.dart';
import 'package:app_shop_dien_tu/models/register.dart';
import 'package:app_shop_dien_tu/models/user.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API {
  final Dio _dio = Dio();
  String baseUrl = "https://huflit.id.vn:4321";

  API() {
    _dio.options.baseUrl = "$baseUrl/api";
  }

  Dio get sendRequest => _dio;
}

class APIRepository {
  API api = API();

  Map<String, dynamic> header(String token) {
    return {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };
  }

Future<String> forgotPassword(Forgotpassword user) async {
    try {
      final body = FormData.fromMap({
        "accountID": user.accountID,
        "numberID": user.numberID,
        "newPass": user.newPass,
      });
      Response res = await api.sendRequest.put('/Auth/forgetPass',
          options: Options(headers: header('no token')), data: body);
      if (res.statusCode == 200) {
        print("ok");
        print(res);
        return "ok";
      } else {
        print("fail");
        return "forgotpass fail";
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }


Future<String> register(Signup user) async {
    try {
      final body = FormData.fromMap({
        "numberID": user.numberID,
        "accountID": user.accountID,
        "fullName": user.fullName,
        "phoneNumber": user.phoneNumber,
        "imageURL": user.imageUrl,
        "birthDay": user.birthDay,
        "gender": user.gender,
        "schoolYear": user.schoolYear,
        "schoolKey": user.schoolKey,
        "password": user.password,
        "confirmPassword": user.confirmPassword
      });
      Response res = await api.sendRequest.post('/Student/signUp',
          options: Options(headers: header('no token')), data: body);
      if (res.statusCode == 200) {
        print("123");
        print(res);
        return "123";
      } else {
        print("fail");
        return "signup fail";
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

Future<String> login(String accountID, String password) async {
    try {
      final body =
          FormData.fromMap({'AccountID': accountID, 'Password': password});
      Response res = await api.sendRequest.post('/Auth/login',
          options: Options(headers: header('no token')), data: body);
      if (res.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final tokenData = res.data['data']['token'];
        print("ok login");
        prefs.setString('token', tokenData);
        prefs.setString('accountID', accountID);
        return tokenData;
      } else {
        return "login fail";
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

    Future<User> current(String token) async {
    try {
      Response res = await api.sendRequest
          .get('/Auth/current', options: Options(headers: header(token)));
      return User.fromJson(res.data);
    } catch (ex) {
      rethrow;
    }
  }
    
    
    Future<List<CategoryModel>> getCategory(
      String accountID, String token) async {
    try {
      Response res = await api.sendRequest.get(
          '/Category/getList?accountID=$accountID',
          options: Options(headers: header(token)));
      return res.data
          .map((e) => CategoryModel.fromJson(e))
          .cast<CategoryModel>()
          .toList();
    } catch (ex) {
      rethrow;
    }
  }

    Future<bool> addCategory(
      CategoryModel data, String accountID, String token) async {
    try {
      final body = FormData.fromMap({
        'name': data.name,
        'description': data.desc,
        'imageURL': data.imageUrl,
        'accountID': accountID
      });
      Response res = await api.sendRequest.post('/addCategory',
          options: Options(headers: header(token)), data: body);
      if (res.statusCode == 200) {
        print("ok add category");
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

    Future<bool> updateCategory(int categoryID, CategoryModel data,
      String accountID, String token) async {
    try {
      final body = FormData.fromMap({
        'id': categoryID,
        'name': data.name,
        'description': data.desc,
        'imageURL': data.imageUrl,
        'accountID': accountID
      });
      Response res = await api.sendRequest.put('/updateCategory',
          options: Options(headers: header(token)), data: body);
      if (res.statusCode == 200) {
        print("ok update category");
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<bool> removeCategory(
      int categoryID, String accountID, String token) async {
    try {
      final body =
          FormData.fromMap({'categoryID': categoryID, 'accountID': accountID});
      Response res = await api.sendRequest.delete('/removeCategory',
          options: Options(headers: header(token)), data: body);
      if (res.statusCode == 200) {
        print("ok remove category");
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

    Future<List<Product>> getProduct(String accountID, String token) async {
    try {
      Response res = await api.sendRequest.get(
          '/Product/getList?accountID=$accountID',
          options: Options(headers: header(token)));
      return res.data
          .map((e) => Product.fromJson(e))
          .cast<Product>()
          .toList();
    } catch (ex) {
      print('haha:::' + ex.toString());
      rethrow;
    }
  }

  Future<bool> addProduct(Product data, String token) async {
    try {
      final body = FormData.fromMap({
        'name': data.name,
        'description': data.description,
        'imageURL': data.image,
        'Price': data.price,
        'CategoryID': data.categoryID
      });
      Response res = await api.sendRequest.post('/addProduct',
          options: Options(headers: header(token)), data: body);
      if (res.statusCode == 200) {
        print("ok add product");
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<bool> removeProduct(
      int productID, String accountID, String token) async {
    try {
      final body =
          FormData.fromMap({'productID': productID, 'accountID': accountID});
      Response res = await api.sendRequest.delete('/removeProduct',
          options: Options(headers: header(token)), data: body);
      if (res.statusCode == 200) {
        print("ok remove product");
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

Future<bool> updateProduct(
      Product data, String accountID, String token) async {
    try {
      final body = FormData.fromMap({
        'id': data.id,
        'name': data.name,
        'description': data.description,
        'imageURL': data.image,
        'Price': data.price,
        'categoryID': data.categoryID,
        'accountID': accountID
      });
      Response res = await api.sendRequest.put('/updateProduct',
          options: Options(headers: header(token)), data: body);
      if (res.statusCode == 200) {
        print("ok update product");
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

Future<bool> addBill(List<Cart> products, String token) async {
    var list = [];
    try {
      for (int i = 0; i < products.length; i++) {
        list.add({
          'productID': products[i].productID,
          'count': products[i].count,
        });
      }
      Response res = await api.sendRequest.post('/Order/addBill',
          options: Options(headers: header(token)), data: list);
      if (res.statusCode == 200) {
        print("add bill ok");
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }


  Future<List<BillModel>> getHistory(String token) async {
    try {
      Response res = await api.sendRequest
          .get('/Bill/getHistory', options: Options(headers: header(token)));
      return res.data
          .map((e) => BillModel.fromJson(e))
          .cast<BillModel>()
          .toList();
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<List<BillDetailModel>> getHistoryDetail(
      String billID, String token) async {
    try {
      Response res = await api.sendRequest.post('/Bill/getByID?billID=$billID',
          options: Options(headers: header(token)));
      return res.data
          .map((e) => BillDetailModel.fromJson(e))
          .cast<BillDetailModel>()
          .toList();
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }
// Future<bool> updateUser(User data, String token) async {
//   try {
//     final body = FormData.fromMap({
//       'idNumber': data.idNumber,
//       'accountID': data.accountId,
//       'fullName': data.fullName,
//       'phoneNumber': data.phoneNumber,
//       'imageURL': data.imageURL,
//       'birthDay': data.birthDay,
//       'gender': data.gender,
//       'schoolYear': data.schoolYear,
//       'schoolKey': data.schoolKey,
//       'dateCreated': data.dateCreated,
//       'status': data.status,
//     });

//     Response res = await api.sendRequest.put('/updateProfile',
//         options: Options(headers: header(token)), data: body);

//     if (res.statusCode == 200) {
//       return true;
//     } else {
//       // In chi tiết lỗi
//       print('Update failed: ${res.statusCode} ${res.statusMessage}');
//       print('Response data: ${res.data}');
//       return false;
//     }
//   } catch (e) {
//     // In lỗi chi tiết
//     print('Exception: $e');
//     return false;
//   }
// }
}

