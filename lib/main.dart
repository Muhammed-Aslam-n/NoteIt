import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:noteit/screens/details/details_full.dart';
import 'package:noteit/screens/details/details_short.dart';
import 'package:noteit/screens/edit/edit_student.dart';
import 'package:noteit/screens/home_noteit.dart';
import 'package:get/get.dart';
import 'package:noteit/screens/search/search_student.dart';
import 'package:path_provider/path_provider.dart';
import 'constants/constants.dart';
import 'controller/controller.dart';
import 'database/db_noteit.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(NoteItAdapter());
  await Hive.openBox<NoteIt>(noteItBoxName);
  final noteItController = Get.put(NoteItController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=> const NoteItHome()),
        GetPage(name: '/fullDetails', page: ()=> const FullDetails()),
        GetPage(name: '/shortDetails', page: ()=> const ShortDetails()),
        GetPage(name: '/searchStudent', page: ()=> const SearchStudent()),
        GetPage(name: '/editStudent', page: ()=> const EditStudent()),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NoteItHome(),
    );
  }
}
