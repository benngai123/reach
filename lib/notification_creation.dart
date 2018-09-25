import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class NotificationCreationPage extends StatefulWidget {
  @override
  createState() => NotificationCreationState();
}

class NotificationCreationState extends State {
  var selectedCourse;
  var imgBytes;

  @override
  Widget build(BuildContext context) {
    var dropdownKeys = ['ALL', 'COMP 7510', 'COMP XXXX'];
    var items = <DropdownMenuItem>[];
    for (var k in dropdownKeys) {
      items.add(DropdownMenuItem(
        child: Text(k),
        value: k,
      ));
    }

    var childWidgets = <Widget>[];
    if (imgBytes != null) {
      childWidgets.add(Image.memory(
        imgBytes,
        width: MediaQuery.of(context).size.width - 150,
      ));
    }
    childWidgets.add(IconButton(
      icon: Icon(Icons.cancel),
      onPressed: () => Fluttertoast.showToast(msg: 'cancel'),
    ));

    return Scaffold(
        appBar: AppBar(
          title: Text('Compose ...'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => Fluttertoast.showToast(msg: 'Camera'),
            ),
            IconButton(
              icon: Icon(Icons.photo),
              onPressed: () => Fluttertoast.showToast(msg: 'Photo'),
            ),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () => Fluttertoast.showToast(msg: 'Share'),
            )
          ],
        ),
        body: Container(
            margin: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Post to',
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.start,
                      ),
                      DropdownButton(
                        value: selectedCourse,
                        items: items,
                        onChanged: (course) =>
                            setState(() => selectedCourse = course),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextField(
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                          decoration: InputDecoration(
                              hintText: 'Mobile App Development'),
                        ),
                        TextField(
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                          decoration: InputDecoration(
                              hintText:
                                  'The notification creation page allows the user to pick photos from the gallery or camera'),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: childWidgets),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 10.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: childWidgets),
                ),
              ],
            )));
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
