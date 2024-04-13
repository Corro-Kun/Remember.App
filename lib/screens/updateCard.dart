import 'dart:io';
import 'dart:math';

import 'package:Reminders/constans.dart';
import 'package:Reminders/db/dataCard.dart';
import 'package:Reminders/models/cardModel.dart';
import 'package:Reminders/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class updateCard extends StatefulWidget {
  cardModel card;
  updateCard({super.key, required this.card});

  @override
  State<updateCard> createState() => _updateCard();
}

class _updateCard extends State<updateCard> {
  final ImagePicker _picker = ImagePicker();
  String pathDefault = '';
  cardModel card = new cardModel(
      idcard: 0,
      name: "",
      description: "",
      link: "",
      isFavorite: 1,
      imagePath: "",
      session_idsession: 1);

  _getCard() {
    setState(() {
      card = widget.card;
    });
  }

  _getPath() {
    setState(() {
      pathDefault = widget.card.imagePath;
    });
  }

  Future<void> _pickImage() async {
    //print(pathDefault);
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

  Future<void> _updateCardOnDb() async {
    var status = await Permission.storage.status;
    if (status.isGranted && !widget.card.imagePath.startsWith("lib")) {
      final Directory? appDocDir = await getExternalStorageDirectory();
      final String path = appDocDir!.path;

      final File imageFile = File(widget.card.imagePath);

      final random = Random();
      const chars =
          'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

      String nameFile = String.fromCharCodes(Iterable.generate(
          30, (_) => chars.codeUnitAt(random.nextInt(chars.length))));

      final Directory imagesDir = Directory('$path/images');
      if (!await imagesDir.exists()) {
        await imagesDir.create(recursive: true);
      }

      final File newImage = await imageFile.copy('$path/images/$nameFile.png');

      //print("newImage: $newImage");

      final File imagenOld = File(pathDefault);

      await imagenOld.delete();

      setState(() {
        card.imagePath = newImage.path;
      });
    }
    dataCard().updateCardData(card).then((value) => {
          Navigator.pop(context, true),
        });
  }

  _delteImage() {
    if (!pathDefault.startsWith("lib")) {
      final File imagenOld = File(pathDefault);
      imagenOld.delete();
    }
  }

  @override
  void initState() {
    super.initState();
    _getPath();
    _getCard();
    _getDecorationImagen(card.imagePath);
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
                controller: TextEditingController(text: card.name),
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
                onChanged: (value) {
                  setState(() {
                    card.name = value;
                  });
                  // print(card.name);
                },
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
                    controller: TextEditingController(text: card.description),
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
                      setState(() {
                        card.description = value;
                      });
                      // print(card.description);
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                controller: TextEditingController(text: card.link),
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
                onChanged: (value) {
                  setState(() {
                    card.link = value;
                  });
                  // print(card.name);
                },
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
                      //print(pathDefault);
                      //Navigator.pop(context);
                      _delteImage();
                      dataCard().deleteCard(card.idcard).then((value) => {
                            Navigator.pop(context, true),
                          });
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
                      _updateCardOnDb();
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
