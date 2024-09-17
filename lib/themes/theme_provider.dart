import 'package:flutter/material.dart';
import 'package:music_player/themes/dark_mode.dart';
import 'package:music_player/themes/light_mode.dart';
// import 'package:musicapptute/themes/light_mode.dart'; // Pastikan nama file sesuai

class ThemeProvider extends ChangeNotifier {
  // Initially, light mode
  ThemeData _themeData = LightMode; // Ubah nama variabel menjadi lebih konsisten

  // Get theme
  ThemeData get themeData => _themeData;
 // dark mode

 bool get isDarkMode => _themeData == DarkMode; 

 // set theme

 set themeData(ThemeData themeData) {
  _themeData = themeData;

  //ui update
  notifyListeners();
 }
// toggle theme method

void toggleTheme() {
  if (_themeData ==  LightMode) {
    themeData = DarkMode;
} else if (_themeData == DarkMode) {
  themeData = LightMode;
}
}
}
