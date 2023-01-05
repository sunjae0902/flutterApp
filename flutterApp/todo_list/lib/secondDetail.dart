import 'package:flutter/material.dart'; //SecondDetail 클래스 정의

class SecondDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    TextEditingController controller=new TextEditingController(); //사용자가 할 일을 추가할 수 있게 하는 텍스트 필드 생성
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pop(controller.value.text); // 버튼을 눌렀을 때 pop하여 1페이지로 이동함
                  },
                  child: Text('저장하기'),),
            ],
          ),
        ),
      )
    );
  }
}
