import 'package:flutter/material.dart'; //라우팅 기능 사용하기

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunpage example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', //첫번째페이지가 초기화면
      routes: {'/': (context) => FirstPage(), //string(경로로 사용할 문자열):widget(해당 경로가 가리키는 위젯) 형태 경로 선언
        '/second':(context)=>SecondPage()},
    );
  }

}

class FirstPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _FirstPage();
}


class _FirstPage extends State<FirstPage>{ //첫번째 페이지 클래스
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Page Main'), //앱바->main화면
      ),
      body: Container(
        child: Center(
          child: Text('첫번째 페이지'), //중간에 표시할 내용
        ),
        ),
        floatingActionButton: FloatingActionButton( //두번째 페이지로 이동할 수 있는 버튼
          onPressed: (){
            Navigator.of(context) //Navigator 클래스: 스택(FILO)을 이용해 페이지를 관리. of(context)함수: 현재 페이지 나타냄
             .pushNamed('/second'); //두번째 페이지를 push함
          },
          child: Icon(Icons.add),
        ),
    );
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
    return Scaffold(
      appBar: AppBar(
        title:Text('Second Page'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop(); //지금 페이지 종료 (pop)
              },
            child: Text('돌아가기'),
          ),
        ),
      )
    );
  }
}
