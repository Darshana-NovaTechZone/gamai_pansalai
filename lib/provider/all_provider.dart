import 'dart:ui';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamai_pansalai/color/color.dart';

class ProviderS with ChangeNotifier {
  bool _is24time = false;

  // Initial color

  bool get is24time => _is24time;

  set is24time(bool time) {
    _is24time = time;
    notifyListeners();
  }

  Color _pwhite1 = white1;
  Color get pwhite1 => _pwhite1;

  set pwhite1(Color i) {
    _pwhite1 = i;
    notifyListeners();
  }

  Color _pwhite2 = white2;
  Color get pwhite2 => _pwhite2;

  set pwhite2(Color i) {
    _pwhite2 = i;
    notifyListeners();
  }

  Color _pwhite3 = white3;
  Color get pwhite3 => _pwhite3;

  set pwhite3(Color i) {
    _pwhite3 = i;
    notifyListeners();
  }

  Color _pwhite = white;
  Color get pwhite => _pwhite;

  set pwhite(Color i) {
    _pwhite = i;
    notifyListeners();
  }

  Color _pblack1 = black1;
  Color get pblack1 => _pblack1;

  set pblack1(Color i) {
    _pblack1 = i;
    notifyListeners();
  }

  Color _pblack = black;
  Color get pblack => _pblack;

  set pblack(Color i) {
    _pblack = i;
    notifyListeners();
  }

  Color _pblack2 = black2;
  Color get pblack2 => _pblack2;

  set pblack2(Color i) {
    _pblack2 = i;
    notifyListeners();
  }

  Color _pblack3 = black3;
  Color get pblack3 => _pblack3;

  set pblack3(Color i) {
    _pblack3 = i;
    notifyListeners();
  }

  Color _pnave = nevColor;
  Color get pnave => _pnave;

  set pnave(Color i) {
    _pnave = i;
    notifyListeners();
  }

  Color _pbackground = bacground;
  Color get pbackground => _pbackground;

  set pbackground(Color i) {
    _pbackground = i;
    notifyListeners();
  }

  Color _pbackground2 = bacground2;
  Color get pbackground2 => _pbackground2;

  set pbackground2(Color i) {
    _pbackground2 = i;
    notifyListeners();
  }

  Color _pb2 = b2;
  Color get pb2 => _pb2;

  set pb2(Color i) {
    _pb2 = i;
    notifyListeners();
  }
}

// task--------------------------------------------------
