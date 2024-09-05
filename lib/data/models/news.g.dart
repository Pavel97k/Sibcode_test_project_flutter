// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      json['id'] as String,
      name: json['name'] as String?,
      image: json['image'] as String?,
      date: json['date'] == null ? null : _parseDate(json['date'] as String),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'date': instance.date?.toIso8601String(),
    };

DateTime? _parseDate(String dateString) {
  try {
    // Define the date format
    final DateFormat format = DateFormat('dd.MM.yyyy');
    return format.parse(dateString);
  } catch (e) {
    // Handle parsing error if needed
    print('Error parsing date: $e');
    return null; // or throw an exception based on your needs
  }
}
