import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Reminders/constans.dart';
import 'package:Reminders/db/dataCard.dart';
import 'package:Reminders/models/cardModel.dart';
import 'package:Reminders/widgets/appBar.dart';

// ignore: must_be_immutable
class form extends StatefulWidget {
  int id = 0;
  form({super.key, required this.id});

  @override
  State<form> createState() => _formState(id: id);
}

class _formState extends State<form> {
  int id = 0;
  _formState({required this.id});

  final ImagePicker _picker = ImagePicker();

  cardModel card = cardModel(
      idcard: 0,
      name: "",
      description: "",
      link: "",
      isFavorite: 0,
      imagePath: "",
      session_idsession: 0);

  DecorationImage image = const DecorationImage(
    image: AssetImage("lib/assets/Waifu.jpg"),
    fit: BoxFit.cover,
  );

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print(pickedFile.path);
      setState(() {
        card.imagePath = pickedFile.path;
      });
      _getDecorationImagen(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  _getCard(int id) async {
    cardModel cards = cardModel(
        idcard: 0,
        name: "",
        description: "",
        link: "",
        isFavorite: 0,
        imagePath: "lib/assets/Waifu.jpg",
        session_idsession: id);
    setState(() {
      card = cards;
    });
  }

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
    if (id != 0) {
      _getCard(id);
    }
    _getDecorationImagen(card.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: const TitleappBar(title: 'Agregar ficha'),
      body: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nombre",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Pon un nombre a tu ficha...',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: AppColors.secondaryTextColor,
                    ),
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
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
                    setState(() {
                      card.name = value;
                    });
                    print(card.name);
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 120,
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
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Pon la descripción de tu ficha aquí...',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: AppColors.secondaryTextColor,
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    border: OutlineInputBorder(
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
                    setState(() {
                      card.description = value;
                    });
                    print(card.description);
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "link",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'http://jetak.ai/iggew...',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: AppColors.secondaryTextColor,
                    ),
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
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
                    setState(() {
                      card.link = value;
                    });
                    print(card.link);
                  },
                ),
              ],
            ),
          ),
          GestureDetector(
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
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: ElevatedButton(
              onPressed: () {
                dataCard().insertCard(card).then((value) => print("insertado"));
                Navigator.pop(context, true);
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryColor,
              ),
              child: const Text(
                "Guardar",
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
