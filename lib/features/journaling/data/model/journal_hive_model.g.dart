// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'journal_hive_model.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class JournalHiveModelAdapter extends TypeAdapter<JournalHiveModel> {
//   @override
//   final int typeId = 0;

//   @override
//   JournalHiveModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return JournalHiveModel(
//       journalId: fields[0] as String?,
//       dateTime: fields[1] as DateTime?,
//       journalTitle: fields[2] as String?,
//       journalmood: fields[3] as String?,
//       place: fields[4] as String?,
//       weather: fields[5] as String?,
//       journalImage: fields[6] as String?,
//       journalContent: fields[7] as String?,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, JournalHiveModel obj) {
//     writer
//       ..writeByte(8)
//       ..writeByte(0)
//       ..write(obj.journalId)
//       ..writeByte(1)
//       ..write(obj.dateTime)
//       ..writeByte(2)
//       ..write(obj.journalTitle)
//       ..writeByte(3)
//       ..write(obj.journalmood)
//       ..writeByte(4)
//       ..write(obj.place)
//       ..writeByte(5)
//       ..write(obj.weather)
//       ..writeByte(6)
//       ..write(obj.journalImage)
//       ..writeByte(7)
//       ..write(obj.journalContent);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is JournalHiveModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
