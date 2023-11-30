import 'package:flutter/material.dart';
import 'package:remember_app/constans.dart';
import 'package:remember_app/widgets/file.dart';

class editor extends StatelessWidget {
  const editor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // añadir un gestorClic para que al darle click se abra la pantalla de añadir
              Icon(
                Icons.delete,
                color: AppColors.primaryTextColor,
                size: 25,
              ),
              Text(
                "Anime",
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.add,
                color: AppColors.primaryTextColor,
                size: 25,
              ),
            ],
          ),
          Container(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 10),
              children: [File(), File()],
            ),
          ),
        ],
      ),
    );
  }
}
