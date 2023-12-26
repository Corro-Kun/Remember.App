import 'package:flutter/material.dart';
import 'package:Reminders/constans.dart';
import 'package:Reminders/db/dataSession.dart';
import 'package:Reminders/models/sessionModel.dart';
import 'package:Reminders/screens/addSectionScreens.dart';
import 'package:Reminders/widgets/section.dart';
import 'package:Reminders/widgets/appBar.dart';

class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  List<sessionModel> session = [];
  bool State = true;

  _getSessions() async {
    List<sessionModel> sessions = await dataSession().getSessions();
    if (mounted) {
      if (State) {
        setState(() {
          session = sessions;
        });
        State = false;
      }
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
                    onRefresh: () async {
                      List<sessionModel> sessions =
                          await dataSession().getSessions();
                      setState(() {
                        session = sessions;
                      });
                    },
                  );
                },
              )),
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () async {
                final Refresh = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddSection()),
                );
                if (Refresh != null) {
                  List<sessionModel> sessions =
                      await dataSession().getSessions();
                  setState(() {
                    session = sessions;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
              child: const Text(
                "Añadir",
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
