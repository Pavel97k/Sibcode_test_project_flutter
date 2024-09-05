import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  final String id;
  final String? name, image, description;
  final DateTime? date;

  News(this.id, {this.name, this.image, this.date, this.description});

  /// Connect the generated [_$NewsFromJson] function to the `fromJson`
  /// factory.
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  /// Connect the generated [_$NewsToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
