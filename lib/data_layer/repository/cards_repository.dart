

import 'package:banking_app/data_layer/models/user_cart.dart';
import 'package:banking_app/data_layer/services/secure_api.dart';

class CardsRepository{

  CardsRepository({required this.secureApiService});

  SecureApiService secureApiService;

  Future<List<UserCart>> fetchUserCards(){
    return secureApiService.getUserCards();
  }
}