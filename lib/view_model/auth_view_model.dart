

import 'package:banking_app/data_layer/local_data/storage.dart';
import 'package:banking_app/data_layer/models/auth_state.dart';
import 'package:banking_app/data_layer/models/register_data.dart';
import 'package:banking_app/data_layer/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier{

  AuthViewModel({required this.authRepository}){
    _init();
  }

  AuthRepository authRepository;

  bool switched = false;
  bool isLoading = false;

  AuthState authState = AuthState.DEFAULT;

  Future<void> _init()async{
    notify(true);
    await StorageRepository.getInstance();
    await Future.delayed(const Duration(seconds: 2), () {
      checkAuthState();
    });
    notify(false);
  }

  void checkAuthState(){
    if(StorageRepository.getString("first_name").isNotEmpty){
      if(StorageRepository.getString("access_token").isNotEmpty){
        authState = AuthState.LOGGED;
      }else{
        authState = AuthState.REGISTERED;
      }
    }else{
      authState = AuthState.NOT_REGISTERED;
    }
    debugPrint("AuthState updated");
  }

  void loginUser({required String email, required String password})async{
    notify(true);
    String token = await authRepository.loginUser(login: email, password: password);
    await authRepository.safeToken(token: token);
    authState = AuthState.LOGGED;
    debugPrint("User Logged");
    notify(false);
  }

  void registerUser({required RegisterData registerData})async{
    notify(true);
    bool isRegistered = await authRepository.registerUser(registerData);
    if(isRegistered){
      authState = AuthState.REGISTERED;
      await authRepository.saveUserData(registerData);
      debugPrint("User Registered");
    }
    notify(false);
  }

  void notify(bool value){
    isLoading = value;
    notifyListeners();
  }

  void onSwitchPressed(){
    switched = !switched;
    notifyListeners();
  }
}