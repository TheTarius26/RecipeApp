// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookmarkAdapter extends TypeAdapter<Bookmark> {
  @override
  final int typeId = 1;

  @override
  Bookmark read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bookmark()
      ..name = fields[0] as String
      ..uri = fields[1] as String
      ..image = fields[2] as String
      ..ingredientLines = (fields[3] as List).cast<String>()
      ..cautions = (fields[4] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, Bookmark obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.uri)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.ingredientLines)
      ..writeByte(4)
      ..write(obj.cautions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookmarkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
