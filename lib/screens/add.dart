import 'package:flutter/material.dart';
import 'package:remember_app/constans.dart';
import 'package:remember_app/widgets/file.dart';
import 'package:remember_app/widgets/appBar.dart';
import 'package:remember_app/widgets/navigationWidget.dart';

class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleappBar(title: "Agregar Recordatorio"),
      backgroundColor: AppColors.secondaryColor,
      body: ListView(
        children: [
          Container(
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
          ),
        ],
      ),
    );
  }
}
