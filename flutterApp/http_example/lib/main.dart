import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //패키지 등록 후 불러와 http로 사용
import 'dart:convert'; //JSON 데이터를 이용할 때 사용하는 convert패키지

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{ 
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget{ //동적 위젯 
  @override
  State<StatefulWidget> createState()=> _HttpApp();
}

class _HttpApp extends State<HttpApp> {
  String result = '';
  List? data; //서버에서 가져온 데이터를 저장할 data 변수
  TextEditingController? _editingController;
  ScrollController? _scrollController; //스크롤 정의, page= 카운트할 변수
  int page=1; 

  @override
  void initState() {  //data 변수를 빈 리스트로 초기화
    super.initState();
    data = new List.empty(growable: true); 
    _editingController =new TextEditingController(); //텍스트 필드 지정(사용자가 검색)
    _scrollController = new ScrollController();
    
    _scrollController!.addListener((){ //스크롤 시 이벤트 처리
      if (_scrollController!.offset >= _scrollController!.position.maxScrollExtent && ! _scrollController!.position.outOfRange){
        print('bottom'); 
        pagg++;
        getJSONData();}
    });
  } /* offset: 현재 위치를 double로 반환, position.outOfRange: 정의된 범위 
  -> 현재 위치가 정의된 범위를 넘어가지 않으면서 최대 한도인 maxScrollExtent보다 크거나 같으면 목록의 맨 마지막으로 인식하고 page를 1증가 시킨 후 새 데이터를 불러옴*/
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField( //텍스트 필드 구현
          controller: _editingController,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: '검색어를 입력하세요.'
          ), //텍스트 필드에 보이는 텍스트를 꾸밈. hinText:어떤 검색어를 입력해야 하는지 알려줌

        ),

      ),
      body: Container(
        child: Center(
          child: data!.length == 0 //데이터가 없을 경우
              ? Text(
                  '데이터가 없습니다.',
                   style: TextStyle(fontSize: 20),
                   textAlign: TextAlign.center)
                   : ListView.builder( //데이터 받음-> itemcount: 목록의 개수, column 생성, data에서 JSON 키 값에 해당하는 값을 화면에 출력
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        child: Row( //행
                          children: <Widget>[
                            Image.network(
                              data![index]['thumbnail'], // Image.network: 네트워크에 있는 이미지를 가져오는 위젯, 목록의 이미지를 가져옴
                              height: 100, width: 100, fit: BoxFit.contain,
                        ),
                            Column( //열, 
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width -150, //현재 사용 기기의 화면 넓이에서 이미지를 뺀 나머지만큼만 제목을 입력. 
                                  child: Text(
                                    data![index]['title'].toString(), //책 제목
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text('저자 : ${data![index]['authors'].toString()}'), //화면에 표시할 책 정보(저자,가격,판매상태) -> 문자열로 변환해주는 toString 함수 사용
                                Text('가격 : ${data![index]['sale_price'].toString()}'),
                                Text('판매상태 : ${data![index]['status'].toString()}'),
                              ],

                            )
                      ],
                          mainAxisAlignment: MainAxisAlignment.start,
                    ),
                  ),
                );
              },
                 itemCount: data!.length, //(목록의 개수=data의 길이)
                 controller: _scrollController,) //스크롤을 내려 마지막에 닿을 때마다 API를 호출해 새로운 책 

        ),
      ),
      floatingActionButton: FloatingActionButton( //내려받기 버튼
        onPressed: ()  {
          page=1;
          data!.clear(); //버튼을 누를 때 마다 기존 내용을 페이지를 1로 초기화 (스크롤 초기화)
          getJASONData();
        },                //비동기함수처리
        child: Icon(Icons.file_download, color: Colors.amber,), //내려받기 모양 아이콘 표시
      ),
    );
  }

  Future<String> getJASONData() async { //비동기로 데이터를 
    var url='https://dapi.kakao.com/v3/search/book?''target=title&query=${_editingController!.value.text}'; //카카오 API에 사용자가 텍스트 필드에 입력한 문자열이 포함된 데이터를 요청함  
    var response= await http.get(Uri.parse(url), //http-GET방식 (데이터 조회)으로 url에 입력한 주소에 데이터를 요청.
        headers: {"Authorization" : "KakaoAK b2a014187e0a4c126eda86aadeeb351e"}); //REST API key (카카오 api에서 발급받은 키로 서버와 통신할 수 있음)
    setState(() {
      var dataConvertedToJSON=json.decode(response.body);
      List result=dataConvertedToJSON['documents'];
      data!.addAll(result);
  });
    return response.body;
  }
}
