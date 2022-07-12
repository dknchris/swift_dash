import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_dash/home/home_screen.dart';
import 'package:swift_dash/providers/theme_provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider(),
      builder: (context, child) {
        return MaterialApp(
          title: 'SwiftDash',
          theme: ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
          ),
          darkTheme: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
          ),
          themeMode: ThemeProvider.getListener(context).themeMode,
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        );
      },
    );
  }
}
