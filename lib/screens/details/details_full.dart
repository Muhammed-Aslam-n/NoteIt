import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteit/constants/constants.dart';
import 'package:noteit/controller/controller.dart';
class FullDetails extends StatelessWidget {
  const FullDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final noteItController = Get.find<NoteItController>();
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: detailsPageDecoration,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            height:height * 0.6,
            width: width * 0.7,
            alignment: Alignment.center,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(
                    noteItController.selectedStudent?.studentName??'',
                  ),
                ),
                detailsSpace,
                ListTile(
                  leading: const Icon(Icons.accessibility),
                  title: Text(
                    noteItController.selectedStudent?.age??'',
                  ),
                ),
                detailsSpace,
                ListTile(
                  leading: const Icon(Icons.margin),
                  title: Text(
                    noteItController.selectedStudent?.rollNumber??'',
                  ),
                ),
                detailsSpace,
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: Text(
                    noteItController.selectedStudent?.mobileNumber??'',
                  ),
                ),
                // Text(''),
                TextButton(
                  onPressed: () {
                    noteItController.editStudentDetails();
                    noteItController.isShortEnabled = true;
                    if(ModalRoute.of(context)?.settings.name == '/fullDetails'){
                      Get.offNamed('/editStudent');
                    }
                  },
                  child: const Icon(Icons.edit),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
