import 'dart:io';

import 'package:hive/hive.dart';
part 'card_info_model.g.dart';

@HiveType(typeId: 0)
class CardInfoModel extends HiveObject{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String img;
  @HiveField(2)
  final String phoneNum;
  @HiveField(3)
  final String email;
  CardInfoModel({required this.img,required this.name, required this.phoneNum, required this.email});
}