import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:Reminders/constans.dart';

class navigationBarBottom extends StatefulWidget {
  final PageController pageController;
  const navigationBarBottom({super.key, required this.pageController});

  @override
  State<navigationBarBottom> createState() => _navigationWidgetState();
}

class _navigationWidgetState extends State<navigationBarBottom> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: AppColors.primaryColor,
      animationDuration: const Duration(milliseconds: 300),
      buttonBackgroundColor: AppColors.primaryColor,
      onTap: (index) {
        widget.pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
      items: const <Widget>[
        Icon(
          Icons.home,
          size: 30,
          color: AppColors.primaryTextColor,
        ),
        Icon(
          Icons.favorite,
          size: 30,
          color: AppColors.primaryTextColor,
        ),
        Icon(
          Icons.add_box_rounded,
          size: 30,
          color: AppColors.primaryTextColor,
        ),
      ],
    );
  }
}
