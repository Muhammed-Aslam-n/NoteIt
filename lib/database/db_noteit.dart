import 'package:hive/hive.dart';

part 'db_noteit.g.dart';


@HiveType(typeId: 0)
class NoteIt{
  @HiveField(0)
  final String? studentName;
  @HiveField(1)
  final String? rollNumber;
  @HiveField(2)
  final String? age;
  @HiveField(3)
  final String? mobileNumber;

  NoteIt(this.studentName, this.rollNumber, this.age, this.mobileNumber);


}
