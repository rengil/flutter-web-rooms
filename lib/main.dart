import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
void main() {
  runApp(MyApp());
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class EmptyScaffold extends StatelessWidget {
  final Widget body;
  final Widget floatingActionButton;
  final Widget bottomNavigationBar;
  final bool primary;
  final Color backgroundColor;

  const EmptyScaffold({
    Key key,
    @required this.body,
    this.primary = false,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: primary,
      body: SafeArea(
        child: body,
      ),
      extendBodyBehindAppBar: true,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor,
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '🐿 Rooms',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ROOM'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return EmptyScaffold(
      body: Center(
        child: Column(children: [
          Title(),
          Padding(padding: EdgeInsets.only(top: 16)),
          Container(
              color: HexColor("#e2f4de"),
              width: MediaQuery.of(context).size.width * 1,
              height: 300,
              child: Room(name: "Room 1", url: 'https://meet.google.com/xft-kbiy-kjc')),
          Padding(padding: EdgeInsets.only(top: 16)),
          Container(
              color: HexColor("#ff9e9d"),
              width: MediaQuery.of(context).size.width * 1,
              height: 300,
              child: Room(name: 'Room 2', url: 'https://meet.google.com/xft-kbiy-kjc'))
        ]),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 16)),
        Text(
          'Rooms',
          style: Theme.of(context).textTheme.headline5,
        ),
        Padding(padding: EdgeInsets.only(top: 4)),
        Text(
          'Rooms you can enter to join',
          style: Theme.of(context).textTheme.headline3,
        ),
        Padding(padding: EdgeInsets.only(top: 16)),
        Text(
          "Select a room and talk with people by theme.",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}

class Room extends StatelessWidget {
  final String name;
  final String url;
  const Room({Key key, this.name, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          name,
          style: Theme.of(context).textTheme.headline3,
        ),
        Padding(padding: EdgeInsets.only(top: 16)),
        InkWell(
            onTap: () {
             html.window.open(url, 'new tab');
            }, // Handle your callback
            child: Text(
              "🔗",
              style: Theme.of(context).textTheme.headline3,
            ))
      ],
    ));
  }
}
