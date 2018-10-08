import 'package:flutter/material.dart';
import 'package:reach/global.dart';
import 'package:intl/intl.dart';

class NotificationListPage extends StatefulWidget {
  @override
  createState() => NotificationListState();
}

class NotificationListState extends State {
  var canCreate = false;
  var nMap = {};

  @override
  void initState() {
    super.initState();
    getRoles().then((_) => getNotificationList());
  }

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    var data = List();
    for (List c in nMap.values) data.addAll(c);

    data.sort((a, b) => b['createdAt'] - a['createdAt']);

//    for (var i = 1; i <= 20; i++) {
//      var item = 'Notification $i';
    for (var i = 0; i < data.length; i++) {
      var item = data[i];
      var title = item['title'];
      var course = item['course'];
      var datetime = DateTime.fromMicrosecondsSinceEpoch(item['createdAt']);
      var createdAt =
          DateFormat('EEE, MMMM d, y H:m:s', 'en_US').format(datetime);

      widgetList.add(ListTile(
        leading: Icon(Icons.notifications),
//        title: Text('Item $i'),
//        trailing: Icon(Icons.face),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              createdAt,
              style: TextStyle(fontSize: 10.0, color: Colors.blueGrey),
            ),
          ],
        ),
        trailing: Text(
          course.replaceAll(' ', '\n'),
          textAlign: TextAlign.right,
        ),
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
        floatingActionButton: (canCreate)
            ? FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () =>
                    Navigator.pushNamed(context, notificationCreation),
              )
            : null);
  }

  void getNotificationList() {
    Set roleSet, courseSet;
    if (roles != null) {
      courseSet = roles.keys.toSet();
      roleSet = roles.values.toSet();
    } else {
      courseSet = Set();
      roleSet = Set();
    }
    courseSet.add('All');
    canCreate =
        roleSet.contains('teacher') || roleSet.contains('administrator');

    for (var c in courseSet) {
      var nRef = dbRef.child('courses/$c/notifications');

      nRef.onValue.listen((event) {
        if (event.snapshot.value == null) {
          nMap.remove(c);
        } else {
          nMap[c] = (event.snapshot.value as Map).values.toList();
        }
        if (mounted) setState(() {});
      });
    }
  }
}
