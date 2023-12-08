import 'package:flutter/material.dart';
import 'package:remember_app/constans.dart';
import 'package:remember_app/db/dataSession.dart';
import 'package:remember_app/models/sessionModel.dart';
import 'package:remember_app/screens/addSection.dart';
import 'package:remember_app/widgets/editor.dart';
import 'package:remember_app/widgets/appBar.dart';

class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  List<sessionModel> session = [];

  _getSessions() async {
    List<sessionModel> sessions = await dataSession().getSessions();
    if (mounted) {
      setState(() {
        session = sessions;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getSessions();
  }

  @override
  Widget build(BuildContext context) {
    // saco el tamaño de la pantalla
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const TitleappBar(title: "Agregar Recordatorio"),
      backgroundColor: AppColors.secondaryColor,
      body: ListView(
        children: [
          Container(
              height: screenSize.height - 270,
              child: ListView.builder(
                itemCount: session.length,
                itemBuilder: (context, index) {
                  return editor(
                    title: session[index].title,
                    id: session[index].idsession,
                    refresh: _getSessions(),
                  );
                },
              )),
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(top: 20, left: 155, right: 155),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddSection())),
              child: const Text(
                "Añadir",
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
