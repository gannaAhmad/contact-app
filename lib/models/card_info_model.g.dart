// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardInfoModelAdapter extends TypeAdapter<CardInfoModel> {
  @override
  final int typeId = 0;

  @override
  CardInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardInfoModel(
      img: fields[1] as String,
      name: fields[0] as String,
      phoneNum: fields[2] as String,
      email: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CardInfoModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.img)
      ..writeByte(2)
      ..write(obj.phoneNum)
      ..writeByte(3)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
