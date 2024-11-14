import 'dart:io';

import 'package:flutter/material.dart';
import 'package:Reminders/constans.dart';

// ignore: must_be_immutable
class file extends StatefulWidget {
  String title = "Default";
  String path = "lib/assets/Waifu.jpg";

  file({
    super.key,
    required this.title,
    required this.path,
  });

  @override
  State<file> createState() => _fileState();
}

class _fileState extends State<file> {
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widthCart() {
      final Size screenSize = MediaQuery.of(context).size;
      final size = (screenSize.width.toDouble() - 60) / 2;

      if (size > 180) {
        return 175.0;
      }

      return size;
    }

    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
      height: 220,
      width: widthCart(),
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
              image: _builderDecorationImage(widget.path),
            ),
          ),
          // is the title
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              widget.title.length > 19
                  ? widget.title.substring(0, 16) + "..."
                  : widget.title,
              style: const TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
