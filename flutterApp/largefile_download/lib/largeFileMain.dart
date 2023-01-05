import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io'; //파일 입출력 패키지(io) 등 사용할 패키지 임포트

class LargeFileMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _LargeFileMain();

}

class _LargeFileMain extends State<LargeFileMain> {
  final imgUrl = 'https://images.pexels.con/photos/240040/pexels-photo-240040.jped?auto=compress'; //다운받을 이미지의 url주소
  bool downloading = false; //내려받는 중인지 확인
  var progressString = ""; //진행 상황을 저장하는 변수
  String file = ""; //내려받은 파일




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Large File Example'),
      ),
      body: Center( //함수 바디 구현
          child: downloading 
              ? Container( //=true일 때 , 다운로드 중일때
                  height: 120.0,
                  width: 200.0,
                  child: Card(
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20.0,
                  ),
                        Text(
                          'Downloading File: $progressString',
                           style: TextStyle(
                             color: Colors.white, //진행 상황을 나타내는 검정 박스에 흰색으로 진행 상황을 출력
                    ),
                  )
                ],
              ),
            ),
          )
              : FutureBuilder( //=false일 경우
                   builder: (context, snapshot){ // builder에서 snapshot반환. -> 받아 온 데이터를 저장한 dynamic 형태의 변수(여러 값 가능)
                     switch(snapshot.connectionState){ //데이터를 받을 때 switch문으로 상태에 따라 나누어 처리.
                       case ConnectionState.none: //데이터가 없는 경우 
                          print('none');
                          return Text('데이터 없음');
                          case ConnectionState.waiting: //아직 연결되기 전일 경우-> 앱 진행 상황을 나타내는 위젯 표시
                          print('waiting');
                          return CircularProgressIndicator();
                       case ConnectionState.active: //하나 이상의 데이터를 반환받을 경우->위와 동일
                         print('active');
                         return CircularProgressIndicator();
                         case ConnectionState.done: //모든 데이터를 다 받았을 경우-> snapshot.data반환
                           print('done'); 
                           if(snapshot.hasData){ 
                             return snapshot.data as Widget;
                           }
                     }
                     print('end process');
                     return Text('데이터 없음');
              },
              future: downloadWidget(file),
          )),
          floatingActionButton: FloatingActionButton(
            onPressed:(){
              downloadFile();
              },
            child: Icon(Icons.file_download),
      ),
    );
  }


  Future<void> downloadFile() async { //파일을 내려받는 비동기식 함수
    Dio dio = Dio(); 
    try {
      var dir = await getApplicationDocumentsDirectory(); //dio 선언 후 내부 디렉토리를 가져옴
      await dio.download(imgUrl, '${dir.path}/myimage.jpg',
          onReceiveProgress: (rec, total) {
            print('Rec: $rec, Total: $total');
            file = '${dir.path}/myimage.jpg'; //file명을 내부 디렉토리에 저장
            setState(() {
              downloading = true; //다운로드 중
              progressString = ((rec / total) * 100).toStringAsFixed(0) + '%'; //red:현재 진행, total: 전체 -> 퍼센티지로 저장
            });
          });
    } catch (e) { //예외처리
      print(e);
    }
    setState(() {
      downloading = false; //다운로드 완료
      progressString = 'Completed';
    });
    print('Download completed');
  }

  Future<Widget> downloadWidget(String filePath) async { //이미지 파일이 있는지 확인 후 있으면 이미지를 화면에 보여주는 위젯을, 없으면 데이터가 없다는 텍스트를 출력하는 비동기식 함수
    File file=File(filePath); //파일 경로를 받아옴
    bool exist=await file.exists();
    new FileImage(file).evict(); //캐시 초기화

    if(exist){
      return Center(
          child: Column(
              children: <Widget>[Image.file(File(filePath))], //이미지를 화면에 보여줌
  ),
  );
  } else { return Text('No Data'); } //
  }
}

