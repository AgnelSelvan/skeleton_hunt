import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:halloween_hunt/assets/assets.dart';
import 'package:halloween_hunt/views/menu/main_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  // if (Platform.isAndroid || Platform.isIOS) {
  //   Flame.device.setLandscape();
  // }
  await Assets.instance.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainMenuView(),
      theme: _defaultTheme(Brightness.dark),
      shortcuts: {
        ...WidgetsApp.defaultShortcuts,
        const SingleActivator(LogicalKeyboardKey.arrowRight):
            const NextFocusIntent(),
        const SingleActivator(LogicalKeyboardKey.arrowLeft):
            const PreviousFocusIntent(),
        const SingleActivator(LogicalKeyboardKey.arrowDown):
            const NextFocusIntent(),
        const SingleActivator(LogicalKeyboardKey.arrowUp):
            const PreviousFocusIntent(),
      },
    );
  }
}

ThemeData _defaultTheme(Brightness brightness) {
  final baseTheme = ThemeData(
    brightness: brightness,
    fontFamily: 'Pixeloid',
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Colors.black,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.red,
      background: Colors.black,
      onBackground: Colors.black,
      surface: Colors.black87,
      onSurface: Colors.black87,
    ),
    cardTheme: CardTheme(
      color: Colors.black,
      elevation: 2,
      shape: Border.all(
        color: Colors.white,
        width: 4,
      ),
    ),
  );

  return baseTheme.copyWith(
    primaryColor: Colors.black,
  );
}
