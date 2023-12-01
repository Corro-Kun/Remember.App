import 'package:flutter/material.dart';
import 'package:remember_app/constans.dart';
import 'package:remember_app/widgets/editor.dart';
import 'package:remember_app/widgets/appBar.dart';

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
          const editor(),
          const editor(),
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(top: 5, left: 155, right: 155),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => print("Añadir"),
              child: const Text(
                "Añadir",
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
