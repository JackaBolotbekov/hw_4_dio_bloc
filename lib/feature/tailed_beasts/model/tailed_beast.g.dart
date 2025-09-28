// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tailed_beast.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TailedBeastAdapter extends TypeAdapter<TailedBeast> {
  @override
  final int typeId = 1;

  @override
  TailedBeast read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TailedBeast(
      name: fields[0] as String,
      images: (fields[1] as List?)?.cast<String>() ?? const [],
    );
  }

  @override
  void write(BinaryWriter writer, TailedBeast obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TailedBeastAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TailedBeast _$TailedBeastFromJson(Map<String, dynamic> json) => TailedBeast(
      name: json['name'] as String,
      images: (json['images'] as List<dynamic>? ?? [])
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TailedBeastToJson(TailedBeast instance) =>
    <String, dynamic>{
      'name': instance.name,
      'images': instance.images,
    };
