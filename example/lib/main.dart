import 'package:flutter/material.dart';
import 'dart:async';

import 'package:desktop_window/desktop_window.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _windowSize = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future _getWindowSize() async {
    var size = await DesktopWindow.getWindowSize();
    setState(() {
      _windowSize = '${size.width} x ${size.height}';
    });
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('desktop_window example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$_windowSize\n'),
              RaisedButton(
                onPressed: _getWindowSize,
                child: Text("getWindowSize"),
              ),
              RaisedButton(
                onPressed: () async {
                  await DesktopWindow.setMinWindowSize(Size(300, 400));
                },
                child: Text("setMinWindowSize(300,400)"),
              ),
              RaisedButton(
                onPressed: () async {
                  await DesktopWindow.setMaxWindowSize(Size(800, 800));
                },
                child: Text("setMaxWindowSize(800,800)"),
              ),
              RaisedButton(
                onPressed: () async {
                  var size = await DesktopWindow.getWindowSize();
                  await DesktopWindow.setWindowSize(
                      Size(size.width - 50, size.height - 50));
                  await _getWindowSize();
                },
                child: Text("Smaller"),
              ),
              RaisedButton(
                onPressed: () async {
                  var size = await DesktopWindow.getWindowSize();
                  await DesktopWindow.setWindowSize(
                      Size(size.width + 50, size.height + 50));
                  await _getWindowSize();
                },
                child: Text("Larger"),
              ),
              RaisedButton(
                onPressed: () async {
                  await DesktopWindow.resetMaxWindowSize();
                  await DesktopWindow.toggleFullScreen();
                },
                child: Text("toggleFullScreen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
