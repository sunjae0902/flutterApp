import 'package:flutter/cupertino.dart'; //쿠퍼티노 패키지 임포트
import 'package:flutter/material.dart';
import 'animalitem.dart';
import 'iosSub/cupertinoFirstPage.dart';
import 'iosSub/cupertinoSecondPage.dart';
class CupertinoMain extends StatefulWidget{ // 동적 위젯을 상속받는 CupertinoMain 클래스 생성,화면 변경 감지
  @override
  State<StatefulWidget> createState(){ //화면을 갱신하는 _Cupertino 함수 리턴
    return _CupertinoMain();

  }
}


class _CupertinoMain extends State<CupertinoMain>{ //State클래스를 상속받는 _Cupertino클래스. 동적 상태위젯은 무조건 State 클래스 필요
  CupertinoTabBar? tabBar; //탭바 선언
  List<Animal> animalList=List.empty(growable: true); //동물 목록 리스트 선언
  @override //함수를 재정의 할때 쓰는 에너테이션
  void initState(){ //위젯 초기화 함수 재정의
    super.initState(); //super: 부모클래스. 여기선 State클래스를 말함
    tabBar=CupertinoTabBar(items: <BottomNavigationBarItem>[ //쿠퍼티노 위젯은 쿠퍼티노 접두어 붙음
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)), //home 아이콘
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.add)), //+아이콘

    ]);
    animalList.add(Animal(animalName: "벌", imagePath:"repo/images/bee.png", kind:"곤충"));
    animalList.add(Animal(animalName: "고양이", imagePath:"repo/images/cat.png", kind:"포유류"));
    animalList.add(Animal(animalName: "젖소", imagePath:"repo/images/cow.png", kind:"포유류"));
    animalList.add(Animal(animalName: "강아지", imagePath:"repo/images/dog.png", kind:"포유류"));
    animalList.add(Animal(animalName: "여우", imagePath:"repo/images/fox.png", kind:"포유류"));
    animalList.add(Animal(animalName: "원숭이", imagePath:"repo/images/monkey.png", kind:"영장류"));
    animalList.add(Animal(animalName: "돼지", imagePath:"repo/images/pig.png", kind:"포유류"));
    animalList.add(Animal(animalName: "늑대", imagePath:"repo/images/wolf.png", kind:"포유류"));

  }

  @override //빌드 함수 재정의, 화면에 보이는 것
  Widget build(BuildContext context){
    return CupertinoApp( //build 함수가 반환하는 함수. 쿠퍼티노 디자인의 위젯 묶음을 사용하기 위해
      home: CupertinoTabScaffold(tabBar: tabBar!, tabBuilder: (context,value){
        if (value==0) { //탭바빌더가 반환하는 값에 따라 로직이 처리됨.
          return CupertinoFirstPage( //0: 첫번째 페이지 리턴
             animalList: animalList);
        }
        else {
          return CupertinoSecondPage(animallist: animalList);
        }
      }),
    );
  }
}