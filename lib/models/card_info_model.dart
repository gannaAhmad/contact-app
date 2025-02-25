import 'dart:io';

class CardInfoModel{
  final String name;
  final File img;
  final String phoneNum;
  final String email;
  CardInfoModel({required this.img,required this.name, required this.phoneNum, required this.email});
}