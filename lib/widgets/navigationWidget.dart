import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:Reminders/constans.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class navigationBarBottom extends StatefulWidget {
  final PageController pageController;
  const navigationBarBottom({super.key, required this.pageController});

  @override
  State<navigationBarBottom> createState() => _navigationWidgetState();
}

class _navigationWidgetState extends State<navigationBarBottom> {
  @override
  Widget build(BuildContext context) {
    /*return CurvedNavigationBar(
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
    */
    return Container(
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: GNav(
          backgroundColor: AppColors.primaryColor,
          color: AppColors.secondaryTextColor,
          activeColor: AppColors.primaryTextColor,
          tabBackgroundColor: AppColors.secondaryColor.withOpacity(0.5),
          onTabChange: (index) {
            widget.pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          padding: EdgeInsets.all(16),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Inicio',
            ),
            GButton(
              icon: Icons.favorite,
              text: 'Favoritos',
            ),
            GButton(
              icon: Icons.add_box_rounded,
              text: 'Añadir',
            ),
          ],
        ),
      ),
    );
  }
}
