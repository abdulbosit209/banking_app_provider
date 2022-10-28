import 'dart:convert';
import 'package:banking_app/data_layer/models/register_data.dart';
import 'package:banking_app/data_layer/models/types_expanses.dart';
import 'package:banking_app/data_layer/models/types_income.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';


class ApiService{

  Future<bool> registerUser({required RegisterData registerData}) async {
    try {
      Response response = await https
          .post(Uri.parse("https://banking-api.free.mockoapp.net/register_user"),
      body: {
        "first_name":registerData.firstName,
        "last_name":registerData.lastName,
        "email":registerData.email,
        "password":registerData.password
      }
      );
      if (response.statusCode == 200) {
       return jsonDecode(response.body)["success"];
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> loginUser({required String login, required String password}) async {
    try {
      Response response = await https
          .post(Uri.parse("https://banking-api.free.mockoapp.net/login"),
      body: {
        "email": login,
        "password": password
      }
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["token"];
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<TypesExpanses>> getTypesExpanses() async {
    try {
      Response response = await https.get(
          Uri.parse("https://banking-api.free.mockoapp.net/expense-types"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<TypesExpanses> typesExpanses = (jsonData as List?)
            ?.map((item) => TypesExpanses.fromJson(item))
            .toList() ??
            [];
        return typesExpanses;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<TypesIncome>> getTypesIncome() async {
    try {
      Response response = await https.get(
          Uri.parse("https://banking-api.free.mockoapp.net/income-types"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<TypesIncome> typesIncome = (jsonData as List?)
            ?.map((item) => TypesIncome.fromJson(item))
            .toList() ??
            [];
        return typesIncome;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
