import 'package:fPix/com/longforus/fPix/page/ImagePage.dart';
import 'package:flutter/material.dart';
import 'package:fPix/com/longforus/fPix/page/ImagePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fPix',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColorDark: Colors.blue[800],
          primaryColorLight: Colors.blue[200],
          primaryColor: Colors.blue,
          accentColor: Colors.lightGreen),
      home: MyHomePage(title: 'fPix'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: new BottomNavigationBar(
          items: _getBottomNvBar(selectedPageIndex),
          currentIndex: selectedPageIndex,
          onTap: (index) {
            setState(() {
              if (index != selectedPageIndex) {
                selectedPageIndex = index;
              }
            });
          },
        ),
        body: _getPage(
            selectedPageIndex) // This trailing comma makes auto-formatting nicer
        // for build methods.
        );
  }

  Widget _getPage(int selectedPageIndex) {
    switch (selectedPageIndex) {
      case 0:
        return new ImagePage();
      case 1:
        return new ImagePage();
      case 2:
        return new ImagePage();
      case 3:
        return new ImagePage();
    }
  }

  List<BottomNavigationBarItem> _getBottomNvBar(int pageIndex) {
    return List.generate(4, (index) {
      return _genBNVItem(index, index == pageIndex);
    }).toList();
  }

  BottomNavigationBarItem _genBNVItem(int index, bool selected) {
    Color accentColor = Theme.of(context).accentColor;
    switch (index) {
      case 0:
        return new BottomNavigationBarItem(
            icon: new Icon(
              Icons.image,color: Colors.grey,
            ),
            activeIcon: new Icon(
              Icons.image,
              color: accentColor,
            ),
            title: new Text("Image",style:TextStyle(color:
            selected?accentColor:Colors.grey),));
      case 1:
        return new BottomNavigationBarItem(
            icon: new Icon(
              Icons.video_label,color: Colors.grey,
            ),
            activeIcon: new Icon(
              Icons.video_label,
              color: accentColor,
            ),
            title: new Text("Video",style:TextStyle(color:
            selected?accentColor:Colors.grey),));
      case 2:
        return new BottomNavigationBarItem(
            icon: new Icon(
              Icons.favorite,color: Colors.grey,
            ),
            activeIcon: new Icon(
              Icons.favorite,
              color: accentColor,
            ),
            title: new Text("Favorite",style:TextStyle(color:
            selected?accentColor:Colors.grey),));
      case 3:
        return new BottomNavigationBarItem(
            icon: new Icon(
              Icons.settings,color: Colors.grey,
            ),
            activeIcon: new Icon(
              Icons.settings,
              color: accentColor,
            ),
            title: new Text("Settings",style:TextStyle(color:
            selected?accentColor:Colors.grey),));
    }
  }
}
