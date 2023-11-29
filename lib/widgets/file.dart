import 'package:flutter/material.dart';
import 'package:remember_app/constans.dart';

class File extends StatelessWidget {
  const File({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
      height: 220,
      width: 175,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          // is the image
          Container(
            margin: const EdgeInsets.all(10),
            height: 165,
            width: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: AssetImage("lib/assets/Waifu.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // is the title
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: const Text(
              "Waifu",
              style: TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
