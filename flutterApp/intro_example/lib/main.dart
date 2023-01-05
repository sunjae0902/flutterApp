import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { //정적 위젯 (갱신x)
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {  //화면 구성. 타이틀 텍스트
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget { //동적 위젯 (갱신되는 부분)
  const MyHomePage({Key? key, required this.title}) : super(key: key);

 
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() { //상태가 변할때 마다 _counter를 1씩 증가시킴
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) { //동적 화면 구성
    
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title), //앱바 타이틀 텍스트
      ),
      body: Center( //바디, 화면 중간에 텍스트 출력 후 _counter 출력 , 버튼 표시
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, //버튼을 누를 때마다 함수 호출 (1씩증가)
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
