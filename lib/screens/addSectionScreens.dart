import 'package:flutter/material.dart';
import 'package:Reminders/constans.dart';
import 'package:Reminders/db/dataSession.dart';
import 'package:Reminders/widgets/appBar.dart';

class AddSection extends StatefulWidget {
  const AddSection({super.key});

  @override
  State<AddSection> createState() => _AddSectionState();
}

class _AddSectionState extends State<AddSection> {
  String title = '';

  void _getTitle(String text) {
    setState(() {
      title = text;
    });
  }

  @override
  void initState() {
    super.initState();
    _getTitle(title);
  }

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
              child: TextField(
                decoration: const InputDecoration(
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
                    floatingLabelStyle: TextStyle(
                      color: AppColors.secondaryTextColor,
                      fontSize: 17,
                    )),
                onChanged: (value) {
                  _getTitle(value);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(50),
              child: GestureDetector(
                onTap: () {
                  if (title != '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Se agrego la sesión ${title}',
                          style: const TextStyle(
                            color: AppColors.primaryTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        duration: Duration(seconds: 2),
                        backgroundColor: AppColors.primaryColor,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    dataSession()
                        .insertSession(title)
                        .then((value) => print("Se ha añadido la sección"));
                    Navigator.pop(context, true);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'se debe agregar un nombre a la sección',
                          style: TextStyle(
                            color: AppColors.primaryTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        duration: Duration(seconds: 2),
                        backgroundColor: AppColors.primaryColor,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 12,
                    left: 18,
                    right: 18,
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
