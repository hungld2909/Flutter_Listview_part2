import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class InfiniteListViewState extends State<InfiniteListView> {
  var items = new List<String>.generate(20, (i) => "Item $i");
  //! create 1 list 20 kí tự
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            
            final widgetItem = (index == items.length)
                ? new RaisedButton(
                    child: const Text(
                      "Load more",
                      style: TextStyle(color: Colors.blue),
                    ),
                    splashColor: Colors.red,
                    elevation: 4.0,
                    onPressed: () {
                      //generate 20 item more
                      var nextItems = new List<String>.generate(20, (i) {
                        var itemId = i + items.length;
                        return "item $itemId";
                      });
                      setState(() {
                        items.addAll(nextItems);
                      });
                    })
                : new ListTile(
                    title: new Text('${items[index]}'),
                  );
            return widgetItem;
          }),
    );
  }
}
class InfiniteListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InfiniteListViewState();
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final materialApp = new MaterialApp(
      title: "",
      home: new InfiniteListView(),
    );
    return materialApp;
  }
}
