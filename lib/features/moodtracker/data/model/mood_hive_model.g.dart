// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoodHiveModelAdapter extends TypeAdapter<MoodHiveModel> {
  @override
  final int typeId = 0;

  @override
  MoodHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoodHiveModel(
      moodId: fields[0] as String?,
      moodLabel: fields[1] as String,
      moodEmoji: fields[2] as String,
      moodDateTime: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MoodHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.moodId)
      ..writeByte(1)
      ..write(obj.moodLabel)
      ..writeByte(2)
      ..write(obj.moodEmoji)
      ..writeByte(3)
      ..write(obj.moodDateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
