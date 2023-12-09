import 'package:flutter/material.dart';
import 'package:remember_app/constans.dart';
import 'package:remember_app/db/dataSession.dart';
import 'package:remember_app/screens/form.dart';
import 'package:remember_app/widgets/file.dart';

class editor extends StatelessWidget {
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
                  onTap: () => {
                    dataSession().deleteSession(id),
                    onRefresh(),
                  },
                  child: const Icon(
                    Icons.delete,
                    color: AppColors.primaryTextColor,
                    size: 25,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.primaryTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => form()),
                    );
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
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 10),
              children: const [File(), File(), File()],
            ),
          ),
        ],
      ),
    );
  }
}
