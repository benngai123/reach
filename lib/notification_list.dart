import 'package:flutter/material.dart';
import 'package:reach/global.dart';

class NotificationListPage extends StatefulWidget {
  @override
  createState() => NotificationListState();
}

class NotificationListState extends State {


  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];

    for (var i = 1; i <= 20; i++) {
      var item = 'Notification $i';
      widgetList.add(ListTile(
        leading: Icon(Icons.notifications),
        title: Text('Item $i'),
        trailing: Icon(Icons.face),

        onTap: () {
          notificationSelection = item;
          Navigator.pushNamed(context, notificationView);
        },
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifactions'),
      ),
      body: ListView(
        children: widgetList,
        padding: EdgeInsets.all(20.0),
      ),
    );
  }


}
