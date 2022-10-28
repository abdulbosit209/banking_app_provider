import 'dart:convert';
import 'package:banking_app/data_layer/models/user_cart.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as https;
import '../local_data/storage.dart';
import '../models/transaction_expanses.dart';
import '../models/transaction_input.dart';

class SecureApiService {

  String token = StorageRepository.getString("access_token");

  Future<List<UserCart>> getUserCards() async {
    try {
      Response response = await https.get(
          Uri.parse("https://banking-api.free.mockoapp.net/user_cards"),
          headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        List<UserCart> userCards = (jsonDecode(response.body) as List?)
            ?.map((e) => UserCart.fromJson(e))
            .toList() ??
            [];
        return userCards;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

Future<List<TransactionExpanses>> getAllTransactionExpanses() async {
  try {
    Response response = await https.get(
        Uri.parse("https://banking-api.free.mockoapp.net/transactions-expenses"),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<TransactionExpanses> transactionExpanses = (jsonData as List?)
          ?.map((item) => TransactionExpanses.fromJson(item))
          .toList() ??
          [];
      return transactionExpanses;
    } else {
      throw Exception();
    }
  } catch (e) {
    throw Exception(e);
  }
}

Future<List<TransactionInput>> getAllTransactionIncomes() async {
  try {
    Response response = await https.get(
        Uri.parse("https://banking-api.free.mockoapp.net/transactions-incomes"),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<TransactionInput> transactionIncomes = (jsonData as List?)
          ?.map((item) => TransactionInput.fromJson(item))
          .toList() ??
          [];
      return transactionIncomes;
    } else {
      throw Exception();
    }
  } catch (e) {
    throw Exception(e);
  }
}

}