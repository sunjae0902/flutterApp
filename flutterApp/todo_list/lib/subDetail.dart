import 'package:flutter/material.dart'; // 첫번째 화면을 표시하는 _SubDetail 클래스 정의, 페이지 이동 함수 구현

class SubDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_SubDetail();
}

class _SubDetail extends State<SubDetail>{
  List<String> todoList=new List.empty(growable: true); //할 일을 추가할 수 있는 리스트, 첫번째 화면에서 아래 목록을 보여줌
  @override
  void initState(){
    super.initState();
    todoList.add('당근 사오기');
    todoList.add('약 사오기');
    todoList.add('청소하기');
    todoList.add('부모님께 전화하기');

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Detail Example'),  //1페이지 앱바 텍스트
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
          return Card(
            child: InkWell(
              child: Text(
                todoList[index],
                style: TextStyle(fontSize: 30),
              ),
              onTap: (){
                Navigator.of(context).pushNamed('/third',arguments: todoList[index]); //3페이지로 
              },
            ),
          );
        },
        itemCount: todoList.length, //할 일 리스트의 길이 (수)
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _addNavigation(context);
          },
        child: Icon(Icons.add),
      ),
    );
  }
  void _addNavigation(BuildContext context) async{
    final result=await Navigator.of(context).pushNamed('/second'); //두번째 페이지에서 새로 추가한 데이터가 result변수에 저장되고, 라우팅 기능으로 페이지를 이동함
    setState(() {
      todoList.add(result as String); //문자열로 형변환하여 리스트에 추가
    });
  }
}
