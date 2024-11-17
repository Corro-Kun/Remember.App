import 'package:flutter/material.dart';
import 'package:Reminders/constans.dart';
import 'package:Reminders/db/dataCard.dart';
import 'package:Reminders/db/dataSession.dart';
import 'package:Reminders/models/cardModel.dart';
import 'package:Reminders/models/sessionModel.dart';
import 'package:Reminders/screens/informationCardScreens.dart';
import 'package:Reminders/widgets/card.dart';
import 'package:Reminders/widgets/appBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<sessionModel> sessions = [];
  int mainCategory = 1;
  List<cardModel> cards = [];

  _getSessions() {
    dataSession().getSessions().then((value) {
      setState(() {
        sessions = value;
      });
    });
  }

  _getMainCategory() {
    setState(() {
      dataSession().getSessions().then((value) {
        setState(() {
          if (value.length > 0) {
            mainCategory = value[0].idsession;
          }
        });
      });
    });
  }

  Color getColor(int id) {
    if (id == mainCategory) {
      return AppColors.primaryColor;
    } else {
      return AppColors.secondaryTextColor;
    }
  }

  _getCards() {
    dataCard().getCards(mainCategory).then((value) {
      setState(() {
        cards = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getSessions();
    _getMainCategory();
    _getCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: const TitleappBar(title: "Tus Recordatorios"),
      body: ListView(
        children: [
          _search(),
          const SizedBox(
            height: 30,
          ),
          _categoriesSelection(),
          const SizedBox(
            height: 20,
          ),
          _tabContent()
        ],
      ),
    );
  }

  Container _tabContent() {
    //Size screenSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      //height: screenSize.height - 335,
      //color: Colors.amber,
      child: Wrap(
        children: List.generate(
          cards.length,
          (index) => GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CardPage(
                  card: cards[index],
                  session: sessions
                      .where((element) => element.idsession == mainCategory)
                      .first,
                ),
              ),
            ),
            child: file(title: cards[index].name, path: cards[index].imagePath),
          ),
        ),
      ),
    );
  }

  Container _categoriesSelection() {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sessions.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => {
              setState(() {
                mainCategory = sessions[index].idsession;
                dataCard().getCards(mainCategory).then((value) => {
                      setState(() {
                        cards = value;
                      })
                    });
              })
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: Text(
                sessions[index].title,
                style: TextStyle(
                  color: getColor(sessions[index].idsession),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container _search() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.05),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        cursorColor: AppColors.primaryColor,
        style: const TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 17,
        ),
        decoration: const InputDecoration(
          hintText: "Buscar",
          hintStyle: TextStyle(
            color: AppColors.secondaryTextColor,
            fontSize: 18,
          ),
          filled: true,
          fillColor: AppColors.primaryColor,
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 27,
            color: AppColors.secondaryTextColor,
          ),
        ),
        onChanged: (value) {
          if (value.length > 0) {
            setState(
              () {
                cards = cards
                    .where((element) => element.name
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                    .toList();
              },
            );
          } else {
            _getCards();
          }
        },
      ),
    );
  }
}
