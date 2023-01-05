import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '/animalitem.dart';

class CupertinoFirstPage extends StatelessWidget{
  final List<Animal> animalList;
  const CupertinoFirstPage({Key? key, required this.animalList}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar( //쿠퍼티노 위젯에 없는 앱바 위젯 대신 사용한 네비게이션 바
        middle: Text('동물 리스트'), // 중간에 텍스트 입력
      ),
      child: ListView.builder(
          itemBuilder:(context,index) {
        return Container(
          padding: EdgeInsets.all(5),
          height: 100,
          child: Column(
            children: <Widget> [
              Row(
                children: <Widget>[
                  Image.asset( //가로열 항목(사진,이름)
                    animalList[index].imagePath!,
                    fit: BoxFit.contain,
                    width: 80,
                    height: 80,
                  ),
                  Text(animalList[index].animalName!),
                ]
              ),
              Container(
                height: 2,
                color: CupertinoColors.black, //목록 사이 검은 선
              )
            ],
          ),
     );
    },
        itemCount: animalList.length,
    ));
  }
}


