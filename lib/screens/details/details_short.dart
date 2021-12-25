import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:noteit/constants/constants.dart';
import 'package:noteit/controller/controller.dart';
import 'package:noteit/widgets/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShortDetails extends StatelessWidget {
  const ShortDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteItController = Get.find<NoteItController>();
    return Scaffold(
      appBar: const CommonAppBar(),
      endDrawer: const CommonDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ValueListenableBuilder(
            valueListenable: noteItController.studentBox!.listenable(),
            builder: (context, noteItController, _) {
              final noteItController = Get.find<NoteItController>();
              final keys =
                  noteItController.studentBox?.keys.cast<int>().toList();
              if (noteItController.studentBox!.isEmpty) {
                return Column(
                  children: const [
                    Text("No Students so far..."),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Add using + Button"),
                  ],
                );
              } else {
                return ListView.separated(
                  itemCount: keys!.length,
                  itemBuilder: (context, index) {
                    final key = keys[index];
                    final studentData = noteItController.studentBox?.get(key);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Slidable(
                        closeOnScroll: true,
                        key: UniqueKey(),
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                            children: [
                            SlidableAction(
                              onPressed: (f){
                                confirmDeletion(key);
                              },
                              backgroundColor: const Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                            SlidableAction(
                              onPressed: (f){
                                noteItController.selectedStudentId = key;
                                noteItController.selectedStudentDetails(key);
                                noteItController.isShortEnabled = true;
                                noteItController.editStudentDetails();
                                Get.toNamed('/editStudent');
                              },
                              backgroundColor: const Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Edit',
                            ),
                          ],
                        ),
                        child: ListTile(
                          onTap: (){
                            noteItController.selectedStudentId = key;
                            noteItController.selectedStudentDetails(key);
                            Get.toNamed('/fullDetails');
                          },
                          title: Text(studentData?.studentName ?? ''),
                          subtitle: Text(studentData?.rollNumber ?? ''),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => divider(),
                );
              }
            },
        ),
      ),
    );
  }
  confirmDeletion(key) async{
    final noteItController = Get.find<NoteItController>();
    await Get.defaultDialog(
      title: "Delete",
      middleText: "Do you really want to delete ?",
      radius: 15,
      textCancel: "No",
      textConfirm: "Yes",
      onCancel: (){
      },
      onConfirm: (){
        noteItController.deleteStudent(key);
        Get.back();
      },
      barrierDismissible: true,
    );
  }
}
