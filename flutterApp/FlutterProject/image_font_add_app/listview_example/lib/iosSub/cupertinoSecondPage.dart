import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/animalitem.dart';

class CupertinoSecondPage extends StatefulWidget{
  final List<Animal> animallist;
  const CupertinoSecondPage({Key? key, required this.animallist}): super(key:key);
  @override
    State<StatefulWidget> createState(){
    return _CupertinoSecondPage();
  }
  }
  class _CupertinoSecondPage extends State<CupertinoSecondPage> {
  TextEditingController? _textController;
  int _kindChoice=0;
  bool _flyExist= false;
  String? _imagePath;

  Map<int,Widget> segmentWidgets={ //맵:딕셔너리 기능. 정수형 key 와 위젯형 value 쌍
    0: SizedBox( //영역을 만들어주는 SizedBox위젯
      child: Text('양서류',textAlign: TextAlign.center),
      width: 80,
    ),
    1: SizedBox(
      child: Text('포유류',textAlign: TextAlign.center),
    ),
    2: SizedBox(
      child: Text('파충류',textAlign: TextAlign.center),
    )
  };

  @override
  void initState(){
    super.initState();
    _textController = TextEditingController(); //텍스트 필드를 사용하기 위한 선언
  }

    @override
    Widget build(BuildContext context ){
      return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('동물 추가하기'),
          ),
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: CupertinoTextField( //ios 스타일 입력창 (추가할 동물의 이름을 입력)
                    controller: _textController,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                  ),

                ),
                CupertinoSegmentedControl(
                  padding: EdgeInsets.only(bottom: 20, top: 20),
                    groupValue: _kindChoice,
                    children: segmentWidgets,
                    onValueChanged: (int value){
                    setState(() {
                      _kindChoice= value;
                    });
                    }),
                Row(
                  children:<Widget> [
                    Text('날개가 존재합니까?'),
                    CupertinoSwitch(
                      value: _flyExist,
                      onChanged: (value){
                        setState(() {
                          _flyExist= value;
                        });
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox( //영역 만듦
                  height: 100, //리스트의 높이
                  child: ListView(
                    scrollDirection: Axis.horizontal, //리스트뷰를 가로로 스크롤
                    children: <Widget>[
                      GestureDetector(
                        child: Image.asset('repo/images/cow.png',width:80),
                        onTap: (){
                          _imagePath='repo/images/cow.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset('repo/images/pig.png',width:80),
                        onTap: (){
                          _imagePath='repo/images/pig.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset('repo/images/bee.png',width:80),
                        onTap: (){
                          _imagePath='repo/images/bee.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset('repo/images/cat.png',width:80),
                        onTap: (){
                          _imagePath='repo/images/cat.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset('repo/images/fox.png',width:80),
                        onTap: (){
                          _imagePath='repo/images/fox.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset('repo/images/monkey.png',width:80),
                        onTap: (){
                          _imagePath='repo/images/monkey.png';
                        },
                      )
                    ],

                  ),
                ),
                CupertinoButton(
                    child: Text('동물 추가하기'),
                    onPressed:() {
                      widget.animallist?.add(Animal(
                        animalName: _textController?.value.text,
                        kind: getKind(_kindChoice),
                        imagePath: _imagePath,
                        flyExist: _flyExist));
                    }
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,



            ),
          ),
        ),
      );

    }
    getKind(int radioValue) {
      switch (radioValue) {
        case 0:
          return '양서류';
        case 1:
          return '포유류';
        case 2:
          return '파충류';
      }
    }


  }

