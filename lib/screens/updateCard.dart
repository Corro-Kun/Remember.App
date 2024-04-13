import 'dart:io';

import 'package:Reminders/constans.dart';
import 'package:Reminders/models/cardModel.dart';
import 'package:Reminders/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class updateCard extends StatefulWidget {
  cardModel card;
  updateCard({super.key, required this.card});

  @override
  State<updateCard> createState() => _updateCard();
}

class _updateCard extends State<updateCard> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      //print(pickedFile.path);

      setState(() {
        widget.card.imagePath = pickedFile.path;
      });
      _getDecorationImagen(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  DecorationImage image = const DecorationImage(
    image: AssetImage("lib/assets/Waifu.jpg"),
    fit: BoxFit.cover,
  );

  DecorationImage _builderDecorationImage(String path) {
    if (path.startsWith("lib")) {
      return const DecorationImage(
        image: AssetImage("lib/assets/Add.png"),
        fit: BoxFit.cover,
      );
    } else {
      return DecorationImage(
        image: FileImage(File(path)),
        fit: BoxFit.cover,
      );
    }
  }

  _getDecorationImagen(String path) {
    setState(() {
      image = _builderDecorationImage(path);
    });
  }

  @override
  void initState() {
    super.initState();
    _getDecorationImagen(widget.card.imagePath);
  }

  @override
  Widget build(BuildContext context) {
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
            Container(
              height: 134,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Descripción",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller:
                        TextEditingController(text: widget.card.description),
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: 'Pon la descripción de tu ficha aquí...',
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: AppColors.secondaryTextColor,
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),

                      // border: OutlineInputBorder(
                      // borderSide: BorderSide(
                      // color: AppColors.primaryColor,
                      // width: 2.0,
                      // ),
                      // ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 2.0,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {});
                      // print(card.description);
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                controller: TextEditingController(text: widget.card.link),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 2.0,
                    ),
                  ),
                  labelText: 'Link de la ficha',
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
            Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => _pickImage(),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  height: 220,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor,
                      image: image),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //Navigator.pop(context);
                    },
                    child: const Text('Eliminar ficha'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.primaryTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(widget.card.imagePath);
                      //Navigator.pop(context);
                    },
                    child: const Text('Actualizar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.primaryTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
