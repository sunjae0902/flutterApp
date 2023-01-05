import 'package:flutter/material.dart';  //머터리얼 스타일로 페이지 이동하기

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
      home: FirstPage(),
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
             .push(MaterialPageRoute(builder: (context)=> SecondPage())); //두번째 페이지를 push하여 스택에 (첫번째페이지, 두번째페이지)로 쌓임 -> 머터리얼 스타일로 페이지가 이동
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
