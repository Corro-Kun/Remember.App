import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:remember_app/constans.dart';
import 'package:remember_app/screens/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryColor,
        appBar: _appBar(),
        body: ListView(
          children: [
            _search(),
            const SizedBox(
              height: 30,
            ),
            _categories_selection(),
            const SizedBox(
              height: 30,
            ),
            _tab_content()
          ],
        ),
        bottomNavigationBar: _navigationBarBottom());
  }

  Container _tab_content() {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      child: Wrap(
        children: [
          GestureDetector(
            // go to the card page
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CardPage())),
            child: Container(
              margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
              height: 220,
              width: 175,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  // is the image
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 165,
                    width: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: AssetImage("lib/assets/Waifu.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // is the title
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: const Text(
                      "Waifu",
                      style: TextStyle(
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _categories_selection() {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () => print("Anime"),
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: const Text(
                "Anime",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: const Text(
                "Manga",
                style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: const Text(
                "Videojuegos",
                style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: const Text(
                "Series",
                style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
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
      child: const TextField(
        decoration: InputDecoration(
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
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text(
        "Tus Recordatorios",
        style: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 24,
        ),
      ),
      backgroundColor: AppColors.secondaryColor,
      elevation: 0.0,
    );
  }

  CurvedNavigationBar _navigationBarBottom() {
    return CurvedNavigationBar(
      backgroundColor: AppColors.secondaryColor,
      color: AppColors.primaryColor,
      animationDuration: const Duration(milliseconds: 300),
      onTap: (index) {
        print(index);
      },
      items: const <Widget>[
        Icon(
          Icons.home,
          size: 30,
          color: AppColors.primaryTextColor,
        ),
        Icon(
          Icons.favorite,
          size: 30,
          color: AppColors.primaryTextColor,
        ),
        Icon(
          Icons.add_box_rounded,
          size: 30,
          color: AppColors.primaryTextColor,
        ),
      ],
    );
  }
}
