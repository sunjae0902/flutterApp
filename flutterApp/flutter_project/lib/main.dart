import 'package:flutter/material.dart'; //다트 클래스나 패키지를 불러올때 사용

void main() {
  runApp(MyApp()); //runApp 함수: binding.dart 클래스에 정의. 플러터의 앱을 시작하는 역할, 매개변수로 화면에 표시할 위젯을 전달함
}

class MyApp extends StatefulWidget {

  @override //애너테이션: createState 함수를 재정의함
  State<StatefulWidget> createState() { //상태 생성 -> mounted==true
    print('createState');
    return _MyApp(); // MyApp 클래스가 현재 화면을 주시하다가 변경이 감지되면 _MyApp 클래스가 화면을 갱신함
  }
}



class _MyApp extends State<MyApp>{ //동적 화면 실행 시 필요한 스테이트풀 위젯. State 클래스를 상속받는 _MyApp 클래스 만듦
  String test= 'hello';
  Color _color=Colors.blue;
  @override
  void initState(){
    super.initState();
    print('initState');
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
  Widget build (BuildContext context){ // BuildContext 클래스: 위젯을 제어할 수 있음
    print('build');
      return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
          darkTheme: ThemeData.light(),
          home: Scaffold(
            body:Center(
              child: ElevatedButton(
                child: Text('$test'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_color)
                ),
                onPressed: (){
                  if (_color==Colors.blue){
                    setState(() {
                      test='flutter';
                      _color=Colors.amber;
                  });
                }
                  else {
                    setState(() {
                      test='Hello';
                      _color=Colors.blue;
                  });
                }
                })),

      ));
  }
}


