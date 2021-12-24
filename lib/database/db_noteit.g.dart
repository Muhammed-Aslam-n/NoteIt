// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_noteit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteItAdapter extends TypeAdapter<NoteIt> {
  @override
  final int typeId = 0;

  @override
  NoteIt read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteIt(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NoteIt obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.studentName)
      ..writeByte(1)
      ..write(obj.rollNumber)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.mobileNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteItAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
