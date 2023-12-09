import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remember_app/constans.dart';
import 'package:remember_app/widgets/appBar.dart';

class form extends StatelessWidget {
  form({super.key});

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: const TitleappBar(title: 'Agregar ficha'),
      body: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nombre",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Lawrence...',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: AppColors.secondaryTextColor,
                    ),
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Descripción",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText:
                        'there respect citizen tears leader stems however gave now idea even natural organized...',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: AppColors.secondaryTextColor,
                    ),
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "link",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'http://jetak.ai/iggew...',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: AppColors.secondaryTextColor,
                    ),
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => _pickImage(),
            child: Text(
              "Imagen",
            ),
          ),
        ],
      ),
    );
  }
}
