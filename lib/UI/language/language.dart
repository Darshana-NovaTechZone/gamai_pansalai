import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'package:provider/provider.dart';

import '../../color/color.dart';
import '../../controller/language_change_controller.dart';
import '../../widget/mainButton.dart';

import '../onbording/intro.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  int tap = 1;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Consumer<LangugageChangeController>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Color(0xfffef9f5),
        body: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(gradient: LinearGradient(colors: [bacground, bacground2], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Stack(
            children: [
              Image.asset(
                'assets/m.jpg',
                width: w,
                height: h,
                fit: BoxFit.cover,
              ),
              Container(
                width: w,
                height: h,
                color: black.withOpacity(0.6),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    Text(
                      'Language',
                      style: TextStyle(fontSize: 32.dp, color: white, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            value.changeLanguage(Locale('en'));
                            setState(() {
                              tap = 1;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'English',
                              style: TextStyle(fontSize: 18.dp, color: white1, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                            ),
                            height: h / 6,
                            width: w / 3,
                            decoration: BoxDecoration(color: tap == 1 ? Colors.pinkAccent : white3, borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            value.changeLanguage(Locale('si'));
                            value.applocal;
                            print(value.applocal);
                            setState(() {
                              tap = 2;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'සිංහල',
                              style: TextStyle(fontSize: 18.dp, color: white1, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                            ),
                            height: h / 6,
                            width: w / 3,
                            decoration: BoxDecoration(color: tap == 2 ? Colors.pinkAccent : white3, borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      width: w / 1.3,
                      child: MainButton(
                          buttonHeight: h / 13,
                          width: w,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => IntroScreen(),
                                ));
                          },
                          text: AppLocalizations.of(context)!.l
                          // ,
                          ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
