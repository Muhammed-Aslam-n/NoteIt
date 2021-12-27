import 'package:flutter/material.dart';
import 'package:noteit/constants/constants.dart';
import 'package:noteit/controller/controller.dart';
import 'package:noteit/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SearchStudent extends StatelessWidget {
  const SearchStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteItController = Get.find<NoteItController>();

    return Scaffold(
      appBar: const CommonAppBar(),
      endDrawer: const CommonDrawer(),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Enter Name'),
                  onChanged: (value) {
                    noteItController.searchStudent(keyword: value);
                  },
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: noteItController.searchResultList,
                  builder: (context, noteItC, _) {
                    if (noteItController.studentBox!.isEmpty) {
                      return const Center(
                        child: Text("No Students so far...")
                      );
                    } else {
                      if(noteItController.searchResultList.value!.isEmpty){
                        return const Center(
                            child: Text("No Students found")
                        );
                      }
                      return ListView.separated(
                        itemCount: noteItController.searchResultList.value!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListTile(
                              tileColor: Colors.grey.shade400,
                              title: Text(
                                noteItController
                                        .searchResultList.value![index].studentName ??
                                    'void',
                              ),
                              subtitle: Text(noteItController.
                                  searchResultList.value![index].rollNumber ??
                                  'void'),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => divider(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
