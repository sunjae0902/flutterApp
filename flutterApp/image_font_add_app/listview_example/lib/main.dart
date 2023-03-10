import 'package:flutter/material.dart';
import '/animalitem.dart';
import 'lib/sub/firstpage.dart';
import 'lib/sub/secondpage.dart';
import '/cupertinoMain.dart';
void main() {
  runApp(CupertinoMain());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with
    SingleTickerProviderStateMixin {
  TabController? controller;
  List<Animal> animalList=new List.empty(growable: true);
  @override
    Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      title: Text('Listview Example'),
    ),
    body: TabBarView(
      children:<Widget> [FirstApp(list: animalList),SecondApp()],
      controller: controller,
    ),
    bottomNavigationBar: TabBar(tabs: <Tab>[
      Tab(icon: Icon(Icons.looks_one,color: Colors.blue),),
      Tab(icon: Icon(Icons.looks_two, color:Colors.blue),)
    ],controller: controller,
    )
    );
    }


    @override
    void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    animalList.add(Animal(animalName: "???", imagePath:"repo/images/bee.png", kind:"??????"));
    animalList.add(Animal(animalName: "?????????", imagePath:"repo/images/cat.png", kind:"?????????"));
    animalList.add(Animal(animalName: "??????", imagePath:"repo/images/cow.png", kind:"?????????"));
    animalList.add(Animal(animalName: "?????????", imagePath:"repo/images/dog.png", kind:"?????????"));
    animalList.add(Animal(animalName: "??????", imagePath:"repo/images/fox.png", kind:"?????????"));
    animalList.add(Animal(animalName: "?????????", imagePath:"repo/images/monkey.png", kind:"?????????"));
    animalList.add(Animal(animalName: "??????", imagePath:"repo/images/pig.png", kind:"?????????"));
    animalList.add(Animal(animalName: "??????", imagePath:"repo/images/wolf.png", kind:"?????????"));



    }


    @override
    void dispose(){
    controller!.dispose();
    super.dispose();
    }




    }


