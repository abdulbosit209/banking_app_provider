
import 'package:flutter/material.dart';

import '../data_layer/models/transaction_expanses.dart';
import '../data_layer/models/transaction_input.dart';
import '../data_layer/models/types_expanses.dart';
import '../data_layer/models/types_income.dart';
import '../data_layer/models/universal_transaction.dart';
import '../data_layer/repository/transacation_repository.dart';

class TransactionViewModel extends ChangeNotifier {
  TransactionViewModel({required this.transactionsRepo}) {
    _init();
  }

  List<TransactionExpanses> expenses = [];
  List<TypesExpanses> expenseTypes = [];
  List<TransactionInput> incomes = [];
  List<TypesIncome> incomeTypes = [];
  List<UniversalTransactionItem> universalItems = [];

  bool isLoading = false;

  final TransactionsRepo transactionsRepo;

  Future<void> fetchData() async {}

  Future<void> _init() async {
    notify(true);
    expenses = await transactionsRepo.getExpenses();
    expenseTypes = await transactionsRepo.getExpenseTypes();
    incomes = await transactionsRepo.getIncomes();
    incomeTypes = await transactionsRepo.getIncomeTypes();
    makeUniversalList();
    notify(false);
  }

  void makeUniversalList() {
    for (var element in expenses) {
      for (var e in element.data) {
        String expenseName = expenseTypes
            .firstWhere((element) => element.id == e.expenseId)
            .expenseType;
        universalItems.add(
          UniversalTransactionItem(
            isExpense: true,
            name: e.receiver.name,
            dateTime: DateTime.parse(e.date),
            imageUrl: e.receiver.brandImage,
            typeName: expenseName,
            amount: e.amount,
          ),
        );
      }
    }

    for (var element in incomes) {
      for (var e in element.data) {
        String expenseName = incomeTypes
            .firstWhere((element) => element.id == e.incomeId)
            .incomeType;
        universalItems.add(
          UniversalTransactionItem(
            isExpense: false,
            name: e.sender.name,
            dateTime: DateTime.parse(e.date),
            imageUrl: e.sender.brandImage,
            typeName: expenseName,
            amount: e.amount,
          ),
        );
      }
    }

    universalItems
        .sort((first, next) => next.dateTime.compareTo(first.dateTime));
  }

  void notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}