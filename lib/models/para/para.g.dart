// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'para.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParaAdapter extends TypeAdapter<Para> {
  @override
  final int typeId = 2;

  @override
  Para read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Para(
      number: fields[0] as int?,
      ayahs: (fields[1] as List?)?.cast<Ayah?>(),
    );
  }

  @override
  void write(BinaryWriter writer, Para obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.ayahs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
