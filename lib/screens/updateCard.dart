
import 'package:Reminders/constans.dart';
import 'package:Reminders/models/cardModel.dart';
import 'package:Reminders/widgets/appBar.dart';
import 'package:flutter/material.dart';

class updateCard extends StatefulWidget{
  cardModel card;
  updateCard({super.key, required this.card});

  @override
  State<updateCard> createState() => _updateCard();
}

class _updateCard extends State<updateCard>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: const TitleappBar(title: 'Actualizar ficha'),
      body: ListView( 
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              controller: TextEditingController(text: widget.card.name),
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 2.0,
                  ),
                ),
                labelText: 'Nombre de la ficha',
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
                ),
              ),
            ),
          ),
        ], 
      )
    );
  }
}
