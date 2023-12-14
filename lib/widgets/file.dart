import 'dart:io';

import 'package:flutter/material.dart';
import 'package:remember_app/constans.dart';

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
  DecorationImage image = const DecorationImage(
    image: AssetImage("lib/assets/Waifu.jpg"),
    fit: BoxFit.cover,
  );

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

  _getImage() {
    setState(() {
      image = _builderDecorationImage(widget.path);
    });
  }

  @override
  void initState() {
    super.initState();
    _getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              image: image,
            ),
          ),
          // is the title
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              widget.title,
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
