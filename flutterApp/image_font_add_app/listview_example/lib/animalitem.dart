import 'package:flutter/material.dart';

class Animal { //이름, 종류 등 동물 정보를 저장하는 클래스
  String? imagePath;
  String? animalName;
  String? kind;
  bool? flyExist= false;
  Animal(
  { required this.animalName,
  required this.imagePath,
  required this.kind,
  this.flyExist
  });




}