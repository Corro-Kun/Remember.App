import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remember_app/constans.dart';
import 'package:remember_app/screens/home.dart';

// https://colorhunt.co/palette/164863427d9d9bbec8ddf2fd

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.secondaryColor,
      systemNavigationBarColor: AppColors.primaryColor,
    ),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
