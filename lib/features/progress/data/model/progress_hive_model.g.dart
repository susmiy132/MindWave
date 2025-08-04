// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProgressHiveModelAdapter extends TypeAdapter<ProgressHiveModel> {
  @override
  final int typeId = 2;

  @override
  ProgressHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProgressHiveModel(
      progressId: fields[0] as String?,
      date: fields[1] as DateTime,
      meditationMinutes: fields[2] as int,
      moodLabel: fields[3] as String,
      moodIconName: fields[4] as String,
      journaled: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ProgressHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.progressId)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.meditationMinutes)
      ..writeByte(3)
      ..write(obj.moodLabel)
      ..writeByte(4)
      ..write(obj.moodIconName)
      ..writeByte(5)
      ..write(obj.journaled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProgressHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
