import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_app/presentation/screens/splash_screen.dart';
import 'package:rick_morty_app/presentation/theme/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Builder(builder: (context) {
        return TextFieldUnfocus(
          child: MaterialApp(
              title: 'Flutter Demo',
              theme: context.watch<ThemeProvider>().theme,
              home: const SplashScreen()),
        );
      }),
    );
  }
}

class TextFieldUnfocus extends StatelessWidget {
  const TextFieldUnfocus({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: child,
      );
}
