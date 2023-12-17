import 'package:flutter/material.dart';
import 'package:remember_app/constans.dart';
import 'package:remember_app/db/dataCard.dart';
import 'package:remember_app/models/cardModel.dart';
import 'package:remember_app/widgets/appBar.dart';
import 'package:remember_app/widgets/file.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<cardModel> cards = [];

  _getCards() {
    dataCard().getCardsFavorite().then((value) {
      setState(() {
        cards = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleappBar(title: "Favoritos"),
      backgroundColor: AppColors.secondaryColor,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10, left: 10),
            child: Wrap(
              children: List.generate(
                  cards.length,
                  (index) => GestureDetector(
                        onTap: () {},
                        child: file(
                            title: cards[index].name,
                            path: cards[index].imagePath),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
