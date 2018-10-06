import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reach/global.dart';

class HomePage extends StatefulWidget {
  @override
  createState() => HomeState();
}

class HomeState extends State {
  @override
  Widget build(BuildContext context) {
    if (null != userID) {
      return menuScreen();
    } else {
      return splashScreen();
    }
  }

  Widget splashScreen() {
    var title = 'REACH\nBen';
    var content = '\nuniversity, teachers, \nclassmates and group mates.\n\n';

    return Scaffold(
      floatingActionButton: IconButton(
          icon: Icon(Icons.accessibility),
          onPressed: () => Fluttertoast.showToast(msg: "haha")),
      backgroundColor: Colors.amberAccent,
      appBar: null,
      body: Container(
        width: MediaQuery.of(context).size.width,
        // get the screen width size of your screen set it to the container
        child: Column(
          // show like linear layout
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 48.0, fontFamily: 'Times New Roman'),
              textAlign: TextAlign.center,
            ),
            Text(
              content,
              style: TextStyle(fontSize: 20.0, fontFamily: 'Times New Roman'),
              textAlign: TextAlign.center,
            ),
            IconButton(
              icon: Icon(Icons.child_care),
              iconSize: 64.0,
              onPressed: () => signIn(context).then((success) {
                    if (success) setState(() {});
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget menuScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text('REACH'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_box),
            onPressed: () => Fluttertoast.showToast(msg: 'Bye Bye'),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          FlatButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.notifications, size: 48.0, color: Colors.white),
                Text(
                  'Notifications',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ],
            ),
            color: Colors.lightBlue,
            onPressed: () => Navigator.pushNamed(context, notificationList),
          ),
          FlatButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.group, size: 48.0, color: Colors.white),
                Text(
                  'Discussion\nGroups',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ],
            ),
            color: Colors.pink,
            onPressed: () => Fluttertoast.showToast(msg: 'Discussion Groups'),
          ),
          FlatButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.assessment, size: 48.0, color: Colors.white),
                Text(
                  'Courses',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ],
            ),
            color: Colors.deepOrange,
            onPressed: () => Fluttertoast.showToast(msg: 'Courses'),
          ),
          FlatButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.create_new_folder, size: 48.0, color: Colors.white),
                Text(
                  'Creation',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ],
            ),
            color: Colors.amber,
            onPressed: () => Navigator.pushNamed(context, notificationCreation),
          )
        ],
      ),
    );
  }
}
