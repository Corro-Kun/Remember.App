import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:remember_app/constans.dart';
import 'package:remember_app/db/dataCard.dart';
import 'package:remember_app/models/cardModel.dart';
import 'package:remember_app/models/sessionModel.dart';
import 'package:url_launcher/url_launcher.dart';

class CardPage extends StatefulWidget {
  cardModel card;
  sessionModel session;

  CardPage({super.key, required this.card, required this.session});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  bool isFavorite = false;
  int stateFavorite = 0;

  DecorationImage _builderDecorationImage(String path) {
    if (path.startsWith("lib")) {
      return const DecorationImage(
        image: AssetImage("lib/assets/Waifu.jpg"),
        fit: BoxFit.cover,
      );
    } else {
      return DecorationImage(
        image: FileImage(File(path)),
        fit: BoxFit.cover,
      );
    }
  }

  _getFavorite() {
    if (widget.card.isFavorite == 0) {
      isFavorite = false;
    } else {
      isFavorite = true;
    }
  }

  _getStateFavorite() {
    stateFavorite = widget.card.isFavorite;
  }

  @override
  void initState() {
    super.initState();
    _getFavorite();
    _getStateFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: ListView(
        children: [
          _Image(context),
          _Description(),
        ],
      ),
    );
  }

  Column _Description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, top: 20),
          child: const Text(
            "Descripción",
            style: TextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 10),
          child: Text(
            widget.card.description,
            style: const TextStyle(
              color: AppColors.secondaryTextColor,
              fontSize: 14,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () async {
              if (await canLaunch(widget.card.link)) {
                await launch(widget.card.link);
              } else {
                throw "No se pudo abrir la url";
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryTextColor,
              backgroundColor: AppColors.primaryColor,
            ),
            child: const Text("Ver más", style: TextStyle(fontSize: 15)),
          ),
        )
      ],
    );
  }

  Container _Image(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
      height: 450,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.black54,
        image: _builderDecorationImage(widget.card.imagePath),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(left: 7),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.secondaryTextColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (stateFavorite == 0) {
                      dataCard()
                          .updateCard(1, widget.card.idcard)
                          .then((value) {
                        print("estado " + 1.toString());
                        setState(() {
                          isFavorite = true;
                          stateFavorite = 1;
                        });
                      });
                    } else {
                      dataCard()
                          .updateCard(0, widget.card.idcard)
                          .then((value) {
                        print("estado " + 0.toString());
                        setState(() {
                          isFavorite = false;
                          stateFavorite = 0;
                        });
                      });
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite
                          ? AppColors.primaryTextColor
                          : AppColors.secondaryTextColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              color: AppColors.primaryColor.withOpacity(0.4),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: 500,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.card.name,
                          style: const TextStyle(
                            color: AppColors.primaryTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                blurRadius: 1,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 5),
                        child: Text(
                          widget.session.title,
                          style: const TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                blurRadius: 1,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
