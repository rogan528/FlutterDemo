//<editor-fold desc="Description">
import 'package:flutter/material.dart';
import 'package:flutter_app/mainpage.dart';

void main() => runApp(MaterialApp(
      title: 'simple login',
      debugShowCheckedModeBanner: false,
      home: AppPage(),
    ));

class AppPage extends StatelessWidget {
  GlobalKey<FormState> _loginKey = GlobalKey();
  String _username;
  String _password;
  void _login(BuildContext context) {
    var loginForm = _loginKey.currentState;
    if (loginForm.validate()) {
      loginForm.save();
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new mainpage()));
      print('username is =$_username && password is =$_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
        child: new ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: 120.0,
          ),
          child: Center(
            child: Form(
              key: _loginKey,
              child: Center(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10.0),
                        labelText: '请输入用户名',
                        icon: Icon(Icons.phone),
                        hintText: '请输入登录用户名',
                      ),
                      onSaved: (val) {
                        _username = val;
                      },
                      onFieldSubmitted: (val) {},
                      validator: (val) {
                        if (val.length == 0) return '用户名不能为空';
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      //keyboardAppearance:Brightness.dark,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10.0),
                        labelText: '请输入密码',
                        hintText: '请输入登录密码',
                        icon: Icon(Icons.lock),
                      ),
                      onSaved: (val) {
                        _password = val;
                      },
                      onFieldSubmitted: (val) {},
                      validator: (val) {
                        if (val.length < 3)
                          return '密码不能小于3个字符';
                        else
                          return null;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.0),
                      child: SizedBox(
                        height: 45.0,
                        width: 450.0,
                        child: RaisedButton(
                          onPressed: () {
                            _login(context);
                          },
                          highlightColor: Colors.cyan,
                          child: Text(
                            '登陆',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
