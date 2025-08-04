// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeditationApiModel _$MeditationApiModelFromJson(Map<String, dynamic> json) =>
    MeditationApiModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$MeditationApiModelToJson(MeditationApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
    };
