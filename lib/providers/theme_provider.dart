import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  static ThemeProvider get(BuildContext context) =>
      Provider.of<ThemeProvider>(context, listen: false);

  static ThemeProvider getListener(BuildContext context) =>
      Provider.of<ThemeProvider>(context, listen: true);

  var _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  bool get isLightTheme => themeMode == ThemeMode.light;

  void toggleTheme() {
    _themeMode = isLightTheme ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
