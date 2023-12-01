import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:gamai_pansalai/UI/splas/splash.dart';
import 'package:gamai_pansalai/provider/all_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'controller/language_change_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  var code = sp!.getString('lCode');
  String lCode = code.toString();
  print('gggggggg');
  print(lCode);
  print('gggggggg');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProviderS()),
      ChangeNotifierProvider(
        create: (_) => LangugageChangeController(),
      ),
    ],
    child: MyApp(local: lCode),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.local});
  final String local;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return FlutterSizer(builder: (context, orientation, screenType) {
      return Consumer<LangugageChangeController>(
        builder: (context, value, child) {
          if (local.isEmpty) {
            value.changeLanguage(Locale(local));
          } else {}
          return MaterialApp(
            title: 'Flutter Demo',
            locale: local == ''
                ? Locale('en')
                : value.applocal == null
                    ? Locale('en')
                    : value.applocal,
            supportedLocales: [
              Locale('si'),
              Locale('en'),
              Locale('sv'),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: Splash(),
          );
        },
      );
    });
  }
}
