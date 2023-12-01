import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';

import '../../provider/all_provider.dart';
import '../home/bana/bana.dart';
import '../home/home.dart';
import '../home/notification/notification.dart';
import '../home/pririth/pirith.dart';
import '../home/profile/profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  bool iconSize1 = false;
  bool iconSize2 = false;
  bool iconSize3 = false;
  bool proImg = false;
  bool unauthorize = false;
  bool maintain = false;
  bool serverOffline = false;

  bool validUser = false;
  Timer? timer;
  int x = 0;
  static List<Widget> _pages = <Widget>[
    Home(),
    Pirith(),
    Bana(),
    NotificationScreen(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        setState(() {
          proImg = true;
        });
      } else {
        setState(() {
          proImg = false;
        });
      }
      log(_selectedIndex.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Consumer<ProviderS>(
      builder: (context, value, child) => Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: value.pwhite,
          bottomNavigationBar: ClipRRect(
            child: Container(
              child: BottomNavigationBar(
                landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
                unselectedIconTheme: IconThemeData(
                  size: 15.dp,
                ),
                unselectedItemColor: value.pwhite2,
                selectedIconTheme: IconThemeData(color: value.pwhite, size: 19.dp),
                selectedItemColor: value.pwhite,
                onTap: _onItemTapped,
                // showSelectedLabels: false,
                // showUnselectedLabels: false,
                backgroundColor: value.pnave,
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: AppLocalizations.of(context)!.n),
                  BottomNavigationBarItem(icon: Icon(Icons.copy_rounded), label: AppLocalizations.of(context)!.n1),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.menu_book,
                      ),
                      label: AppLocalizations.of(context)!.n2),
                  BottomNavigationBarItem(icon: Icon(Icons.notifications), label: AppLocalizations.of(context)!.n3),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                      ),
                      label: AppLocalizations.of(context)!.n4),
                ],
              ),
            ),
          ),
          body: _pages.elementAt(_selectedIndex)),
    );
  }
}
