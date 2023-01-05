import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart'; //파일입출력 패키지
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart'; //과일 리스트 텍스트 파일을 공유 환경설정 파일에 저장


class FileApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _FileApp();

}

class _FileApp extends State<FileApp>{
  int _count=0;
  List<String> itemList=new List.empty(growable:true);
  TextEditingController controller=new TextEditingController();

  Future<List<String>> readListFile() async{ //함수를 처음 실행하면 에셋에 등록한 파일을 읽어서 내부 저장소에 다시 저장 장
    var key='first';
    SharedPreferences pref= await SharedPreferences.getInstance(); //공유환경설정 패키지
    bool? firstcheck=pref.getBool(key); // 키 변수값에서 bool값을 가져옴(first)-> firstcheck변수에 저장. 이후에 파일을 처음 열었는지 확인
    var dir= await getApplicationDocumentsDirectory();
    bool fileExist=await File(dir.path+'/fruit.txt').exists();
    //내부 저장소에 과일 파일의 존재 유무를 확인 후 bool 값으로 저장. File().exist()함수
    //이후에 파일이 있는지 확인하는 용도로 사용

    if(firstcheck==null || firstcheck==false || fileExist==false){ //파일을 처음 열었거나 없는경우
      pref.setBool(key,true); //공유 환경 설정에 true값 저장. 파일 열었음 기록. 에셋에 기록한 파일을 읽어 내부 저장소에 똑같은 파일 생성.
      // 새로 만든 파일을 줄바꿈 문자를 기준으로 나누어 배열 형태(array)로 만든 후 아이템을 리스트에 추가해서 리스트 반환
      var file =
          await DefaultAssetBundle.of(context).loadString('repo/fruit.txt');

      File(dir.path+'/fruit.txt').writeAsStringSync(file);
      var array=file.split('\n');
      for (var item in array){
        print(item);
        itemList.add(item);
      }
      return itemList;

    } else{ //파일을 처음 연 경우가 아닐떄-> 파일의 데이터를 리스트로 만들어 반환, 대상 파일을 내부 저장소의 fruit파일로 지정
      var file= await File(dir.path +'/fruit.txt').readAsString();
      var array= file.split('\n');
      for (var item in array) {
        print(item);
        itemList.add(item);
      }
      return itemList;
    }

  }
  void writeFruit(String fruit) async { //내부 저장소에 추가한 과일의 이름을 저장
    var dir=await getApplicationDocumentsDirectory();
    var file = await File(dir.path+'/fruit.txt').readAsString();
    file=file + '\n' + fruit; //과일 이름 구분자 \n
    File(dir.path+'/fruit.txt').writeAsStringSync(file);
  }

  @override
  void initState(){
    super.initState();
    readCountFile(); //앱이 실행될 초기에 파일에서 가져온 데이터를 표시하기 위해 read함수 호출
    initData();
  }

  void initData() async{
    var result=await readListFile();
    setState(() {
      itemList.addAll(result);

    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('File Example'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context,index){
                    return Card(
                      child: Center(
                        child: Text(
                          itemList[index],
                          style: TextStyle(fontSize: 30),
                      ),
                    ),
                  );
                },
                  itemCount: itemList.length,
              ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          writeFruit(controller.value.text); //플로팅 버튼을 누를때 사용자가 입력한 값을 전달
          setState(() {
           itemList.add(controller.value.text);
          });
          writeCountFile(_count); //버튼을 누를때마다 증가한 카운트 값을 write함수에 인자로 전달하여 파일에 저장
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void writeCountFile(int count) async {
    //파일 입출력함수. 작업이 언제 끝날지 몰라서 비동기 함수로 구현.
      var dir = await getApplicationDocumentsDirectory(); //내부 저장소의 경로를 가져오는 함수. 그곳에 파일을 읽거나 씀
      File(dir.path+'/count.txt').writeAsStringSync(count.toString()); //카운트 값을 매개변수로 받아 count.txt이름 파일을 만들어 문자열로 저장

  }

  void readCountFile() async{ //해당 파일을 다시 읽어 정수형으로 변환 후 count변수에 저장한는 함수
    try{
      var dir=await getApplicationDocumentsDirectory();
      var file=await File(dir.path+'/count,txt').readAsString();
      print(file);
      setState(() {
        _count=int.parse(file);
      });
    } catch(e){ //에러가 날 경우 출력
      print(e.toString());
    }

    }
  }


