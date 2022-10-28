import 'package:banking_app/data_layer/models/transaction_expanses.dart';
import 'package:banking_app/data_layer/services/api_service.dart';
import '../models/transaction_input.dart';
import '../models/types_expanses.dart';
import '../models/types_income.dart';
import '../services/secure_api.dart';

class TransactionsRepo {
  TransactionsRepo({
    required this.secureApiService,
    required this.openApiService,
  });

  final SecureApiService secureApiService;
  final ApiService openApiService;

  Future<List<TransactionExpanses>> getExpenses() => secureApiService.getAllTransactionExpanses();

  Future<List<TransactionInput>> getIncomes() => secureApiService.getAllTransactionIncomes();

  Future<List<TypesIncome>> getIncomeTypes() => openApiService.getTypesIncome();

  Future<List<TypesExpanses>> getExpenseTypes() =>
      openApiService.getTypesExpanses();
}



/*





class TransactionRepository{

  TransactionRepository({required this.apiService});

  ApiService apiService;

  Future<List<TransactionInput>> transactionInput(){
    return apiService.getAllTransactionIncomes();
  }

  Future<List<TransactionExpanses>> transactionExpanses(){
    return apiService.getAllTransactionExpanses();
  }
}
 */