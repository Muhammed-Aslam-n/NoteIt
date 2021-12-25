import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteit/constants/constants.dart';
import 'package:noteit/controller/controller.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        leading: Image.asset(appBarIcon),
        backgroundColor: Colors.blueAccent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              appName,
              style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.w600,
                  fontSize: 26),
            ),
            Text(
              appSlogan,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget contentBox({heading, desc, color}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: color,
    ),
    margin: const EdgeInsets.all(20),
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          heading,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 25, 10, 15),
          child: Text(
            desc,
            style: const TextStyle(
                letterSpacing: 2,
                wordSpacing: 1.2,
                color: Color.fromARGB(170, 196, 44, 59)),
          ),
        )
      ],
    ),
  );
}

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteItController = Get.find<NoteItController>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/images_carousal/School4.jfif"),
                      fit: BoxFit.cover),
                ),
                child: Text(''),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  ownerName,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  ownerQualification,
                  style: TextStyle(fontSize: 14),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Utilities",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15, color: Colors.blueAccent, letterSpacing: 2),
          ),
          const Divider(
            color: Colors.blueAccent,
            thickness: 1.3,
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.wysiwyg_outlined),
                SizedBox(
                  width: 20,
                ),
                Text("View Students"),
              ],
            ),
            onTap: () {
              Get.back();
              Get.back();
              if (ModalRoute.of(context)?.settings.name == '/') {
                Get.toNamed('/shortDetails');
              } else {
                Get.offNamed('/shortDetails');
              }
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.search_outlined),
                SizedBox(
                  width: 20,
                ),
                Text("Search Students"),
              ],
            ),
            onTap: () {
              Get.back();
              if (ModalRoute.of(context)?.settings.name == '/') {
                Get.toNamed('/searchStudent');
              } else {
                Get.offNamed('/searchStudent');
              }
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.add),
                SizedBox(
                  width: 20,
                ),
                Text("Add Students"),
              ],
            ),
            onTap: () {
              noteItController.selectedStudentId = -1;
              debugPrint("Route is ${ModalRoute.of(context)?.settings.name}");
              Get.back();
              if (ModalRoute.of(context)?.settings.name == '/') {
                noteItController.isShortEnabled = false;
                Get.toNamed('/editStudent');
              } else {
                Get.offNamed('/editStudent');
              }
            },
          ),
        ],
      ),
    );
  }
}

commonText({text, color, weight, size}) {
  return Text(
    text ?? '',
    style: TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 15,
      fontWeight: weight ?? FontWeight.w600,
    ),
  );
}
