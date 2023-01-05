import 'package:flutter/material.dart';
import 'largeFileMain.dart'; //클래스가 정의된 파일 임포트 
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
       
      home: LargeFileMain(), //이미지 파일을 내려받는 클래스 
    );
  }
}

