import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reach/global.dart';

class NotificationViewPage extends StatefulWidget {
  @override
  createState() => NotificationViewState();
}

class NotificationViewState extends State {
  var imgBytes;

  @override
  Widget build(BuildContext context) {
    var childWidgets = <Widget>[];

    childWidgets.add(Text('Here is the content of the notification..'));
    if (imgBytes != null) {
      childWidgets.add(Image.memory(
        imgBytes,
        width: MediaQuery.of(context).size.width - 120,
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('$notificationSelection'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Column(
            children: childWidgets,
          )
        ],
      ),
      persistentFooterButtons: <Widget>[Text('Created by ...')],
    );
  }

  @override
  void initState() {
    super.initState();

    var url = 'http://www.comp.hkbu.edu.hk/~mandel/comp7510/comp7510.jpg';
    http.get(url).then((response) {
      print('download complete');
      setState(() => imgBytes = response.bodyBytes);
    });
  }
}
