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
    return Scaffold(
      appBar: const TitleappBar(title: "Agregar Recordatorio"),
      backgroundColor: AppColors.secondaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Refresh = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddSection()),
          );
          if (Refresh != null) {
            List<sessionModel> sessions = await dataSession().getSessions();
            setState(() {
              session = sessions;
            });
          }
        },
        child: const Icon(Icons.add, color: AppColors.primaryTextColor),
        backgroundColor: AppColors.primaryColor,
      ),
      body: ListView.builder(
        itemCount: session.length,
        itemBuilder: (context, index) {
          return editor(
            title: session[index].title,
            id: session[index].idsession,
            onRefresh: () async {
              List<sessionModel> sessions = await dataSession().getSessions();
              setState(() {
                session = sessions;
              });
            },
          );
        },
      ),
    );
  }
}
