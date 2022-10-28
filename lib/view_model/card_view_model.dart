
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data_layer/models/user_cart.dart';
import '../data_layer/repository/cards_repository.dart';

class CardsViewModel extends ChangeNotifier {
  CardsViewModel({required this.cardsRepository}){
    fetchUserCards();
  }

  final CardsRepository cardsRepository;

  List<UserCart> _userCards = [];

  List<UserCart> get getUserCards => _userCards;

  bool isLoading = false;

  Future<void> fetchUserCards() async {
    notify(true);
    _userCards = await cardsRepository.fetchUserCards();
    notify(true);
  }

  void notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
