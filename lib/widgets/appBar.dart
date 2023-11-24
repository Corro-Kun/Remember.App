import 'package:flutter/material.dart';
import 'package:remember_app/constans.dart';

class TitleappBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const TitleappBar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 24,
        ),
      ),
      backgroundColor: AppColors.secondaryColor,
      elevation: 0.0,
    );
  }
}
