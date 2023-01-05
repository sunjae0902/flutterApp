import 'package:flutter/material.dart';

void main() { //main

  print("start");
  
  var stream = Stream.periodic(Duration(seconds: 1),(x)=> x+1) //데이터를 순서대로 주고받을 때 사용하는 스트림. 매초마다 데이터를 1개씩 최대 5개 생성
  .take(5)
  .listen((x)=> print('periodic: $x')); //동기적 데이터 생성 시 이벤트 처리->출력

   Stream.fromIterable(['one','2.5','three',4,5]).listen((dynamic x)=> print('fromIterable: $x'));  //일반적으로 데이터를 처리

   Stream.fromFuture(getData()).listen((x)=> print('fromFuture: $x')); //비동기식 함수 처리. 3초 지연 후 데이터 처리
   print('do something');

}

Future <String> getData() async{ //비동기방식 함수 
  return Future.delayed(Duration(seconds: 3),()=> 'after 3 seconds');
}


