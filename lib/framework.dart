import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(framework());

class framework extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '首页',
      routes: {'/other': (BuildContext context) => OtherPage()},
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _widgetOptions = [
    Text('信息'),
    Text('通讯录'),
    Text('发现'),
    Text('我'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
      ),
      body: _widgetOptions.elementAt(_currentIndex),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, '/other');
      },
      tooltip: '路由跳转',
        foregroundColor: Colors.red,
        backgroundColor: Colors.cyan,
        elevation: 0.0,
        child: Icon(Icons.arrow_forward),
        shape: RoundedRectangleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          title: Text('信息'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts),
          title: Text('通讯录'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.near_me),
          title: Text('发现'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text('我'),
        ),
      ],
      // ignore: expected_token
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
      },),
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OtherPage'),
      ),
    );
  }
}