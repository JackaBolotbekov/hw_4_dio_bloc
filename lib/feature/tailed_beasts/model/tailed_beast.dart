import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tailed_beast.g.dart';

// Берём только name и images
@HiveType(typeId: 1)
@JsonSerializable()
class TailedBeast {
  @HiveField(0)
  final String name;

  // Массив строк; иногда бывает пустой — это ок
  @HiveField(1)
  @JsonKey(defaultValue: [])
  final List<String> images;

  const TailedBeast({
    required this.name,
    required this.images,
  });

  factory TailedBeast.fromJson(Map<String, dynamic> json) =>
      _$TailedBeastFromJson(json);

  Map<String, dynamic> toJson() => _$TailedBeastToJson(this);
}
