

import 'package:banking_app/data_layer/models/register_data.dart';

import '../local_data/storage.dart';
import '../services/api_service.dart';

class AuthRepository {

  AuthRepository({required this.apiService});
  ApiService apiService;

  Future<bool> registerUser(RegisterData registerData)  {
    return  apiService.registerUser(registerData: registerData);
  }

  Future<String> loginUser({required String login, required String password})  {
    return  apiService.loginUser(login: login, password: password);
  }

  Future<bool?> safeToken({required String token}) async {
    return await StorageRepository.putString(key: "access_token", value:  token);
  }

  Future<void> saveUserData(RegisterData registerData) async {
    await StorageRepository.putString(key: "first_name", value: registerData.firstName);
    await StorageRepository.putString(key: "last_name", value: registerData.lastName);
    await StorageRepository.putString(key: "email", value: registerData.email);
    await StorageRepository.putString(key: "password", value: registerData.password);
  }
}