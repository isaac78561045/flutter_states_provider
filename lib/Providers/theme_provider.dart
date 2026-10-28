import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  String _title = 'Contador con provider';

  ThemeMode get themeMode => _themeMode;
  String get title => _title;

  void changeTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void changeTitle(String newTitle) {
    if (newTitle.trim().isEmpty) return;
    _title = newTitle.trim();
    notifyListeners();
  }
}
