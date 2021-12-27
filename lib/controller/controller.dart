import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:noteit/constants/constants.dart';
import 'package:noteit/database/db_noteit.dart';


class NoteItController extends GetxController{

  TextEditingController studentName = TextEditingController().obs();
  TextEditingController studentAge = TextEditingController().obs();
  TextEditingController studentMobile = TextEditingController().obs();
  TextEditingController studentRoll = TextEditingController().obs();

  Box<NoteIt>? studentBox;
  List<NoteIt>? searchResult = [].obs().cast<NoteIt>();
  NoteIt? selectedStudent;
  int selectedStudentId = 0.obs();
  int editingStudentId = 0.obs();

  @override
  void onInit() {
    studentBox = Hive.box<NoteIt>(noteItBoxName);
    super.onInit();
  }

  addStudent(){
    final studentModel = NoteIt(studentName.text, studentRoll.text, studentAge.text, studentMobile.text);
    if(selectedStudentId == -1){
      clear();
      studentBox?.add(studentModel);
    }else{
      studentBox?.put(selectedStudentId, studentModel);
      clear();
      selectedStudentId = -1;
    }
  }
  clear(){
    studentName.clear();
    studentAge.clear();
    studentRoll.clear();
    studentMobile.clear();
  }
  ValueNotifier<List<NoteIt>?> searchResultList = ValueNotifier(<NoteIt>[]);
  searchStudent({keyword = 'notSearched'}){
    debugPrint("Search keyWord $keyword");
    keyword != null && keyword != 'notSearched'?searchResultList.value = studentBox?.values
        .where((item) => item.studentName!.toLowerCase().contains(keyword??''))
        .toList():[];
  }

  selectedStudentDetails(id){
    selectedStudent = studentBox!.get(id);
  }

  editStudentDetails(){
    studentName.text = selectedStudent?.studentName??'';
    studentAge.text = selectedStudent?.age??'';
    studentRoll.text = selectedStudent?.rollNumber??'';
    studentMobile.text = selectedStudent?.mobileNumber??'';
  }

  deleteStudent(key){
    studentBox?.delete(key);
  }

  bool isShortEnabled = false;
  bool isAddingFromShortDetail = false;


}