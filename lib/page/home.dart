import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff427D9D),
        appBar: _appBar(),
        body: ListView(
          children: [
            _search(),
            const SizedBox(
              height: 30,
            ),
            _categories_selection()
          ],
        ),
        bottomNavigationBar: _navigationBarBottom());
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
                  color: Color(0xff164863),
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
                  color: Color(0xff9BBEC8),
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
                  color: Color(0xff9BBEC8),
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
                  color: Color(0xff9BBEC8),
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
            color: Color(0xff9BBEC8),
            fontSize: 18,
          ),
          filled: true,
          fillColor: Color(0xff164863),
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 27,
            color: Color(0xff9BBEC8),
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
          color: Color(0xffDDF2FD),
          fontSize: 24,
        ),
      ),
      backgroundColor: const Color(0xff427D9D),
      elevation: 0.0,
    );
  }

  CurvedNavigationBar _navigationBarBottom() {
    return CurvedNavigationBar(
      backgroundColor: const Color(0xff427D9D),
      color: const Color(0xff164863),
      animationDuration: const Duration(milliseconds: 300),
      onTap: (index) {
        print(index);
      },
      items: const <Widget>[
        Icon(
          Icons.home,
          size: 30,
          color: Color(0xffDDF2FD),
        ),
        Icon(
          Icons.favorite,
          size: 30,
          color: Color(0xffDDF2FD),
        ),
        Icon(
          Icons.add_box_rounded,
          size: 30,
          color: Color(0xffDDF2FD),
        ),
      ],
    );
  }
}
