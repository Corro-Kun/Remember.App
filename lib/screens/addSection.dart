import 'package:flutter/material.dart';
import 'package:remember_app/constans.dart';
import 'package:remember_app/db/dataSession.dart';
import 'package:remember_app/widgets/appBar.dart';

class AddSection extends StatelessWidget {
  const AddSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: const TitleappBar(title: "Añadir Sección"),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 2.0,
                    ),
                  ),
                  labelText: 'Nombre de la sección...',
                  labelStyle: TextStyle(
                    color: AppColors.secondaryTextColor,
                    fontSize: 17,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(50),
              child: GestureDetector(
                onTap: () {
                  dataSession().getData().then((value) => print(value));
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                    left: 20,
                    right: 20,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Text(
                    "Añadir",
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
