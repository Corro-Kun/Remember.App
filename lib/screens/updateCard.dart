
import 'package:Reminders/constans.dart';
import 'package:Reminders/widgets/appBar.dart';
import 'package:flutter/material.dart';

class updateCard extends StatefulWidget{
  int id = 0;
  updateCard({super.key, required this.id});

  @override
  State<updateCard> createState() => _updateCard(id: id);
}

class _updateCard extends State<updateCard>{
  int id = 0;
  _updateCard({required this.id});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: const TitleappBar(title: 'Actualizar ficha'),
      body: ListView(
        
      )
    );
  }
}
