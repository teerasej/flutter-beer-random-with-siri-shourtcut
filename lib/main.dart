import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Start point
void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'What to eat',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primarySwatch: Colors.blue, fontFamily: "Noto"),
      home: new MyHomePage(title: 'กินไรดี'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _mealList = [
    'เบียร์สิงห์',
    'เบียร์ช้าง',
    'เบียร์อาซาฮี',
    'เบียร์ลีโอ',
    'เบียร์ฮอปส์',
    'เบียร์กินเนส',
  ];

  String _currentMeal = "";
  bool _confirmVisibity = false;

  _MyHomePageState() {
    SystemChannels.lifecycle.setMessageHandler((msg) {
      debugPrint('SystemChannels> $msg');
      if (msg == "paused") {
        _clearResult();
      } else {
        _showNewMeal();
      }
    });
  }

  void _showNewMeal() {
    var random = Random();
    var meal = _mealList[random.nextInt(_mealList.length)];


    setState(() {

      if (meal == _currentMeal) {
        _confirmVisibity = true;
      } else {
        _confirmVisibity = false;
      }

      _currentMeal = meal;

      
    });
  }

  void _clearResult() {
    setState(() {
      _currentMeal = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _confirmVisibity
                  ? Text(
                      'ก็บอกว่า',
                      style: TextStyle(fontSize: 60.0),
                    )
                  : new Container(),
              new Text(
                '$_currentMeal',
                style: TextStyle(fontSize: 60.0),
              ),
              new Text(
                'ไงล่ะ',
                style: TextStyle(fontSize: 60.0),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('จัดมา'),
          onPressed: () {
            _showNewMeal();
          },
        ));
  }
}
