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
      body: buildListView(),
    );
  }

  ListView buildListView() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(list[index]),
            direction: DismissDirection.endToStart,
            child: ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('${list[index]}'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            background: Container(
              color: Colors.redAccent,
            ),
            /*onDismissed: (dicection){
              setState(() {
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("${list[index]}")));
                list.removeAt(index);
              });
            }*/
          );
        });
  }
}
