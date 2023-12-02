import 'package:flutter/material.dart';
import 'package:remember_app/constans.dart';

class AddSection extends StatelessWidget {
  const AddSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Column(
          children: [
            Text("Add Section"),
          ],
        ),
      ),
    );
  }
}
