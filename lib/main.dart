import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remember_app/constans.dart';
import 'package:remember_app/screens/add.dart';
import 'package:remember_app/screens/favorites.dart';
import 'package:remember_app/screens/home.dart';
import 'package:remember_app/widgets/navigationWidget.dart';

// https://colorhunt.co/palette/164863427d9d9bbec8ddf2fd

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.secondaryColor,
      systemNavigationBarColor: AppColors.primaryColor,
    ),
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: const <Widget>[
            HomePage(),
            Favorites(),
            add(),
          ],
        ),
        bottomNavigationBar:
            navigationBarBottom(pageController: _pageController),
      ),
    );
  }
}
