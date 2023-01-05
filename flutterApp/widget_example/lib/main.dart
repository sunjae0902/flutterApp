import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title='Widget Example';

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:_title,
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget{
  @override
  _WidgetExampleState createState()=> _WidgetExampleState();

}

class _WidgetExampleState extends State<WidgetApp>{
  String sum='';
  TextEditingController value1=TextEditingController();
  TextEditingController value2=TextEditingController();
  List _buttonList=['덧셈','뺄셈','곱셈','나눗셈'];
  List<DropdownMenuItem<String>> _dropDownMenuItems= new List.empty(growable:true);
  String? _buttonText;

  @override
  void initState(){
    super.initState();
    for (var item in _buttonList){
      _dropDownMenuItems.add(DropdownMenuItem(value: item,child: Text(item)));
    }
    _buttonText=_dropDownMenuItems[0].value;
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Example'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(15),
                child: DropdownButton(items:_dropDownMenuItems,onChanged: (String? value){
                  setState(() {
                    _buttonText=value;
                  });
                },value: _buttonText),
              ),
              Padding(padding: EdgeInsets.all(15),
              child: Text('결과: $sum',
              style: TextStyle(fontSize: 20),),
      ),
              Padding(padding: EdgeInsets.only(left:20,right:20),
              child: TextField(keyboardType: TextInputType.number,controller: value1),
              ),
              Padding(padding: EdgeInsets.only(left:20,right:20),
                child: TextField(keyboardType: TextInputType.number,controller: value2),
              ),
              Padding(padding: EdgeInsets.all(15),
              child: ElevatedButton(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      Text(_buttonText!)
                    ],),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
                  onPressed: (){
                    setState(() {
                      var value1Int=double.parse(value1.value.text);
                      var value2Int=double.parse(value2.value.text);
                      var result;
                      if (_buttonText=='덧셈'){
                        result=value1Int+value2Int;
                      }
                      else if (_buttonText=='뺄셈'){
                        result=value1Int-value2Int;
                      }
                      if (_buttonText=='곱셈'){
                        result=value1Int*value2Int;
                      }
                      if (_buttonText=='나눗셈'){
                        result=value1Int/value2Int;
                      }
                      sum='$result';
                    });

                  }),
              ),
            ],

          ),
        ),
      ),
    );
  }
}