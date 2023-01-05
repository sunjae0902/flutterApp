import 'package:flutter/material.dart'; //마지막 페이지

class ThirdDetail extends StatelessWidget{
  @override


  Widget build(BuildContext context){
    final String args = ModalRoute.of(context)!.settings.arguments.toString(); // 라우터로 전달받은 데이터를 문자열로 변환하여 가져옴. 2페이지에서 보낸 argeument값을 입력하고 텍스트 위젯에 출력한다.
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),

      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop(); //스택에서 세번째 페이지가 제거되고, SubDetail 페이지로 돌아옴.
            },
            child: Text(args,
              style: TextStyle(fontSize: 30)) , //가져온 텍스트 표시 (할 일 리스트 화면에서 특정 할 일을 선택하면 3페이지 이동하여 그 할 일의 텍스트를 화면 중간에 보여줌)
          ),
        ),
      ),
    );
  }
}
