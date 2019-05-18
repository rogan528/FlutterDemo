import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(mainpage());

class mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    Message(),
    Contact(),
    Find(),
    My(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/17.jpg'),
              ),
              accountName: Text('张彬'),
              accountEmail: Text('3097940262@qq.com'),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/tzd.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('会员支付'),
              onTap: () {
                print('click');
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alipayDialog(context);
                    });
              },
            ),
            AboutListTile(
              icon: Icon(Icons.favorite),
              child: Text('关于'),
              applicationName: '开发者:张彬',
              applicationVersion: '版本号:1.0.0',
            ),
          ],
        ),
      ),
    );
  }

  Widget alipayDialog(BuildContext context) {
    return AlertDialog(
      title: Text('会员支付'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('是否进行支付？'),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('确定'),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new Message()));
          },
        ),
        FlatButton(
          child: Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> list = List.generate(20, (index) => "列表展示 $index 元素");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '信息',
        ),
        centerTitle: true,
        elevation: 0.0,
        leading: Icon(Icons.arrow_back),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
    );
  }
}

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '通讯录',
        ),
        centerTitle: true,
        elevation: 0.0,
        leading: Icon(Icons.arrow_back),
        actions: <Widget>[
          Icon(Icons.add),
        ],
      ),
      body: new ListViewState(),
    );
  }
}

class ListViewState extends StatefulWidget {
  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<ListViewState> {
  List<String> list = List.generate(20, (index) => "列表展示 $index 元素");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Dismissible(
              key: Key(list[index]),
              direction: DismissDirection.endToStart,
              child: ListTile(
                title: Text('${list[index]}'),
              ),
              background: Container(
                color: Colors.redAccent,
              ),
              onDismissed: (dicection) {
                setState(() {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("${list[index]}")));
                  list.removeAt(index);
                });
              });
        });
  }
}

class Find extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '发现',
        ),
        centerTitle: true,
      ),
    );
  }
}

class My extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '我',
        ),
        centerTitle: true,
      ),
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
