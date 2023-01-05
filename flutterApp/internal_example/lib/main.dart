
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; //패키지 임포트


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'), //첫 화면 앱 제목
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; 

  void _setData(int value) async{ //_MyHomePageState 클래스에 카운트를 저장하는 비동기 함수
    var key='count';
    SharedPreferences pref=await SharedPreferences.getInstance();  //해당 클래스의 객체 pref를 생성한 후 setInt 함수 호출-> 공유 환경설정 파일에 데이터 저장
    pref.setInt(key, value); //데이터 저장(count, 키-값 쌍으로)
  }

  void _loadData() async{ //카운트 값 (공유 환경설정 파일에 저장된 값)을 가져오는 함수
    var key= 'count';
    SharedPreferences pref=await SharedPreferences.getInstance(); //객체 생성 후 가져옴
    setState(() {
      var value=pref.getInt(key);
      if (value==null) { //값이 없을 경우
        _counter = 0;
      } else { //받은 경우 _counter 변수에 저장
        _counter=value;

      }
    });
  }

  @override
  void initState(){ //앱 실행 초기에 호출되는 함수
    super.initState();
    _loadData();
  }

  void _incrementCounter() { //버튼을 누를 때마다 호출되는 함수-> _counter 1증가-> 데이터 저장 후 
    setState(() {
      _counter++;
      _setData(_counter); 
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: Center(
        
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
