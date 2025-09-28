import 'package:json_annotation/json_annotation.dart';

part 'tailed_beast.g.dart';

// Берём только name и images
@JsonSerializable()
class TailedBeast {
  final String name;

  // Массив строк; иногда бывает пустой — это ок
  final List<String> images;

  TailedBeast({
    required this.name,
    required this.images,
  });

  factory TailedBeast.fromJson(Map<String, dynamic> json) =>
      _$TailedBeastFromJson(json);

  Map<String, dynamic> toJson() => _$TailedBeastToJson(this);
}
