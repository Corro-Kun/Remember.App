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
        children: const [editor(), editor()],
      ),
    );
  }
}
