

import 'package:banking_app/data_layer/models/types_expanses.dart';
import 'package:banking_app/data_layer/models/types_income.dart';
import 'package:banking_app/data_layer/services/api_service.dart';

class ExpansesRepository{

  ExpansesRepository({required this.apiService});

  ApiService apiService;

  Future<List<TypesExpanses>> expansesType(){
    return apiService.getTypesExpanses();
  }

  Future<List<TypesIncome>> incomeType(){
    return apiService.getTypesIncome();
  }
}