import 'package:flutter/material.dart';
import 'package:remember_app/constans.dart';
import 'package:remember_app/db/dataCard.dart';
import 'package:remember_app/db/dataSession.dart';
import 'package:remember_app/models/cardModel.dart';
import 'package:remember_app/screens/addTabScreens.dart';
import 'package:remember_app/widgets/card.dart';

// ignore: must_be_immutable
class editor extends StatefulWidget {
  String title = "Default";
  int id = 0;
  final Function onRefresh;

  editor({
    super.key,
    required this.title,
    required this.id,
    required this.onRefresh,
  });

  @override
  State<editor> createState() => _editorState();
}

class _editorState extends State<editor> {
  List<cardModel> cards = [];

  _getCards() {
    dataCard().getCards(widget.id).then((value) {
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
    return Container(
      height: 275,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // añadir un gestorClic para que al darle click se abra la pantalla de añadir
                GestureDetector(
                  onTap: () async => {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Se ha eliminado la sesión ${widget.title}',
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
                    ),
                    await dataSession().deleteSession(widget.id),
                    widget.onRefresh(),
                  },
                  child: const Icon(
                    Icons.delete,
                    color: AppColors.primaryTextColor,
                    size: 25,
                  ),
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: AppColors.primaryTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final refresh = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => form(
                          id: widget.id,
                        ),
                      ),
                    );
                    if (refresh != null) {
                      widget.onRefresh();
                      List<cardModel> value =
                          await dataCard().getCards(widget.id);
                      setState(() {
                        cards = value;
                      });
                    }
                  },
                  child: const Icon(
                    Icons.add,
                    color: AppColors.primaryTextColor,
                    size: 25,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 10),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return file(
                  title: cards[index].name,
                  path: cards[index].imagePath,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
