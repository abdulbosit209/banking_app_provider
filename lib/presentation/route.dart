import 'package:banking_app/presentation/login/login/login_screen.dart';
import 'package:banking_app/presentation/set_pin/set_pin.dart';
import 'package:banking_app/presentation/splash/spash_screen.dart';
import 'package:banking_app/presentation/tabs/tabs_screen.dart';
import 'package:banking_app/presentation/transactions/transaction.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'login/register/register.dart';

class MyRouter{
  static Route<dynamic> generatedRoute(RouteSettings settings){
    switch(settings.name){
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case tabRoute:
        return MaterialPageRoute(builder: (_) => TabBox());
      case setPinRoute:
        return MaterialPageRoute(builder: (_) => SetPinScreen());
      case transactionsRoute:
        return MaterialPageRoute(builder: (_) => TransactionsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(
          body: Text("Page not found"),
        ));
    }
  }

}