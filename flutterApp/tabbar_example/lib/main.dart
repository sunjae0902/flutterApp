import 'package:flutter/material.dart';
import 'package:tabbar_example/sub/firstpage.dart';
import 'package:tabbar_example/sub/secondpage.dart'; //페이지 임포트

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with
    SingleTickerProviderStateMixin {
  TabController? controller;       //탭 컨트롤러 선언 
  @override
  
    Widget build(BuildContext context){ 
    return Scaffold( //화면 구성, 스캐폴드 클래스
      appBar: AppBar( 
      title: Text('Tabbar Example'), //탭바 타이틀 텍스트
    ),
    body: TabBarView(
      children:<Widget> [FirstApp(),SecondApp()], //화면의 바디. 탭 컨트롤러에 따라 첫번째페이지/두번째 페이지 표시
      controller: controller,
    ),
    bottomNavigationBar: TabBar(tabs: <Tab>[ //탭바 아이콘 생성
      Tab(icon: Icon(Icons.looks_one,color: Colors.blue),),
      Tab(icon: Icon(Icons.looks_two, color:Colors.blue),)
    ],controller: controller,
    )
    );
    }


    @override
    void initState() { 
    super.initState();
    controller = TabController(length: 2, vsync: this); //콜백 함수 처리 위치, length: 몇개의 탭을 만들 건지 결정
    }


    @override
    void dispose(){ //위젯의 상태 관리를 종료하는 함수 dispose() 재정의, 스테이트풀이 마지막에 호출하는 함수로, 사용하지 않을 시 메모리 누수 가능
    controller!.dispose();
    super.dispose();
    }




    }


