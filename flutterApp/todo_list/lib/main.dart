import 'package:flutter/material.dart';
import 'package:todo_list/thirdPage.dart';
import 'subDetail.dart';
import 'secondDetail.dart'; //필요한 클래스가 정의된 파일 임포트

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  static const String _title='Widget Example'; //정적 위젯 클래스 정의

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: _title,
     initialRoute: '/', 
     routes: {
       '/':(context)=>SubDetail(), //라우팅 기능 이용. 초기화면: 첫번째페이지
       '/second':(context)=>SecondDetail(),  //2페이지로 이동
       '/third':(context)=>ThirdDetail() //3

     },
   );
  }
}



