import 'package:banking_app/presentation/route.dart';
import 'package:banking_app/utils/constants.dart';
import 'package:banking_app/utils/theme.dart';
import 'package:banking_app/view_model/auth_view_model.dart';
import 'package:banking_app/view_model/card_view_model.dart';
import 'package:banking_app/view_model/chat_view_model.dart';
import 'package:banking_app/view_model/pin_view_model.dart';
import 'package:banking_app/view_model/transaction_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'data_layer/db/local_database.dart';
import 'data_layer/repository/auth_repository.dart';
import 'data_layer/repository/cards_repository.dart';
import 'data_layer/repository/chat_repository.dart';
import 'data_layer/repository/transacation_repository.dart';
import 'data_layer/services/api_service.dart';
import 'data_layer/services/secure_api.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  //
  ApiService openApiService = ApiService();
  SecureApiService secureApiService = SecureApiService();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);



  runApp(

    MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (_) => TransactionViewModel(
            transactionsRepo: TransactionsRepo(
              openApiService: openApiService,
              secureApiService: secureApiService,
            ),
          )
      ),
      ChangeNotifierProvider(
        create: (_) => AuthViewModel(
          authRepository: AuthRepository(apiService: openApiService),
        ),
      ),
      ChangeNotifierProvider(
        create: (_) => CardsViewModel(
          cardsRepository:
          CardsRepository(secureApiService: secureApiService),
        ),
      ),
      ChangeNotifierProvider(
        create: (_) => ChatViewModel(
            chatRepository: ChatRepository(localDatabase: LocalDatabase())
        ),
      ),
      ChangeNotifierProvider(
        create: (_) => PinViewModel(),
      ),
    ],

        child: EasyLocalization(
            supportedLocales: const [
              Locale('en', 'EN'),
              Locale('ru', 'RU'),
              Locale('uz', 'UZ')
            ],

            path: 'assets/translations',
            saveLocale: true,
            fallbackLocale: const Locale('en', 'EN'),
            child: const MyApp())
    ),


  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: MyRouter.generatedRoute,
      initialRoute: splashRoute,
    );
  }
}
