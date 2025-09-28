// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tailed_beast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TailedBeast _$TailedBeastFromJson(Map<String, dynamic> json) => TailedBeast(
  name: json['name'] as String,
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$TailedBeastToJson(TailedBeast instance) =>
    <String, dynamic>{'name': instance.name, 'images': instance.images};
