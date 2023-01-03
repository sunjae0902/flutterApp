import 'package:flutter/material.dart';
import 'package:todo_list/thirdPage.dart';
import 'subDetail.dart';
import 'secondDetail.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  static const String _title='Widget Example';

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: _title,
     initialRoute: '/',
     routes: {
       '/':(context)=>SubDetail(), //초기화면: 첫번째페이지
       '/second':(context)=>SecondDetail(),
       '/third':(context)=>ThirdDetail()

     },
   );
  }
}



