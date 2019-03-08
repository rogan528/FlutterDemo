import 'package:flutter/material.dart';

class SwippeToDissmissDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SwippeToDissmissState();
  }
}

class _SwippeToDissmissState extends State<SwippeToDissmissDemo> {
  List<String> list = List.generate(20, (index) => "列表展示 $index 元素");
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("张彬"),
      ),
      body: ListView.builder(
          itemCount: list.length, itemBuilder: (context, index) {
            return Dismissible(
              key: Key(list[index]),
              direction: DismissDirection.endToStart,
              child: ListTile(title: Text('${list[index]}'),),
              background: Container(
                color: Colors.redAccent,
              ),
              onDismissed: (dicection){
                setState(() {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("${list[index]}")));
                  list.removeAt(index);
                });
              }
            );
      }),
    );
  }
}
