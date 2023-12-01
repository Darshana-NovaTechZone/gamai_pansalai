import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangugageChangeController with ChangeNotifier {
  Locale? _appLocale;
  Locale? get applocal => _appLocale;

  void changeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _appLocale = type;
    print('fffffffffffffffffffff');
    print(type);
    print('fffffffffffffffffffff');
    if (type == Locale('en')) {
      await sp.setString('lCode', 'en');
      print('qqqqqqqff');
    } else {
      print('fffffffffffxxxxxxxxffffffffff');
      sp.setString('lCode', 'si');
      sp.getString('lCode');
      print('qqqqqqqfaaaaaaaaaaaaaaaaaaf');
      print(sp.getString('lCode'));
    }
    notifyListeners();
  }
}
