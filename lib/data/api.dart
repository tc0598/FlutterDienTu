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
}

