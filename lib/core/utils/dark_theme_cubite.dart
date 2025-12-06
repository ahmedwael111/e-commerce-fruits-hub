import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// part 'theme_cubit_state.dart';

class ThemeCubitCubit extends Cubit<ThemeData> {
  ThemeCubitCubit() : super(_lightTheme);

  // Define the light and dark theme data
  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
  );

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.grey[900],
  );

  // Toggle between themes
  void toggleTheme() {
    emit(state.brightness == Brightness.light ? _darkTheme : _lightTheme);
  }
}
