import 'package:flutter/material.dart';

const noteItBoxName = "NoteIt";

final List<String> carousalImages = [
  "assets/images/images_carousal/School1.jfif",
  "assets/images/images_carousal/School2.jfif",
  "assets/images/images_carousal/School3.jfif",
  "assets/images/images_carousal/School4.jfif",
  "assets/images/images_carousal/School5.jfif",
];
const appBarIcon = "assets/images/icons/AppbarICon.png";
const appName = "NoteIt";
const appSlogan = "Impression Matters";
const ownerName = "Muhammed Aslam n";
const ownerQualification = "Ass.Prof Computer Science";

const descriptionText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged";

divider() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Divider(
        thickness: 0.3,
        color: Colors.blueAccent.shade400,
      ),
    );

const detailsSpace = SizedBox(
  height: 25,
);

const sizedw1 = SizedBox(width: 10,);
const sizedh1 = SizedBox(height: 10,);
const sizedw2 = SizedBox(width: 20,);

const detailsPageDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(170, 255, 91, 107),
      Color.fromARGB(255, 251, 91, 107)
    ],
  ),
);

