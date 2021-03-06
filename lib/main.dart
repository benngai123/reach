import 'package:flutter/material.dart';
import 'package:reach/global.dart';
import 'package:reach/home.dart';
import 'package:reach/notification_list.dart';
import 'notification_view.dart';
import 'notification_creation.dart';

void main() {
  firebaseInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        notificationList: (BuildContext context) => NotificationListPage(),
        notificationView: (BuildContext context) => NotificationViewPage(),
        notificationCreation: (BuildContext context) =>
            NotificationCreationPage(),
      },
    );
  }
}
