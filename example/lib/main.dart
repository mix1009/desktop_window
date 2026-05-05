import 'package:flutter/material.dart';
import 'dart:async';

import 'package:desktop_window/desktop_window.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
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
              ElevatedButton(
                onPressed: _getWindowSize,
                child: const Text('getWindowSize'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await DesktopWindow.setMinWindowSize(const Size(300, 400));
                },
                child: const Text('setMinWindowSize(300,400)'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await DesktopWindow.setMaxWindowSize(const Size(800, 800));
                },
                child: const Text('setMaxWindowSize(800,800)'),
              ),
              Wrap(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var size = await DesktopWindow.getWindowSize();
                      await DesktopWindow.setWindowSize(
                          Size(size.width - 50, size.height - 50));
                      await _getWindowSize();
                    },
                    child: const Text('Smaller'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var size = await DesktopWindow.getWindowSize();
                      await DesktopWindow.setWindowSize(
                          Size(size.width + 50, size.height + 50));
                      await _getWindowSize();
                    },
                    child: const Text('Larger'),
                  ),
                ],
              ),
              Wrap(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await DesktopWindow.resetMaxWindowSize();
                      await DesktopWindow.toggleFullScreen();
                    },
                    child: const Text('toggleFullScreen'),
                  ),
                  Builder(builder: (ctx) {
                    return ElevatedButton(
                      onPressed: () async {
                        final isFullScreen =
                            await DesktopWindow.getFullScreen();
                        ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
                            content: Text('getFullScreen = $isFullScreen'),
                            duration: const Duration(seconds: 1)));
                      },
                      child: const Text('getFullScreen'),
                    );
                  }),
                  ElevatedButton(
                    onPressed: () async {
                      await DesktopWindow.setFullScreen(true);
                    },
                    child: const Text('setFullScreen(true)'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await DesktopWindow.setFullScreen(false);
                    },
                    child: const Text('setFullScreen(false)'),
                  ),
                ],
              ),
              Wrap(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await DesktopWindow.toggleBorders();
                    },
                    child: const Text('toggleBorders'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await DesktopWindow.setBorders(true);
                    },
                    child: const Text('setBorders(true)'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await DesktopWindow.setBorders(false);
                    },
                    child: const Text('setBorders(false)'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // ignore: avoid_print
                      print('hasBorders: ' +
                          (await DesktopWindow.hasBorders ? 'true' : 'false'));
                    },
                    child: const Text('hasBorders'),
                  ),
                ],
              ),
              Wrap(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Timer(const Duration(seconds: 3), () async {
                        // ignore: avoid_print
                        print('focus!!!');
                        await DesktopWindow.focus();
                      });
                    },
                    child: const Text('focus'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // ignore: avoid_print
                      print('stayOnTop(true)');
                      await DesktopWindow.stayOnTop(true);
                    },
                    child: const Text('stayOnTop(true)'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // ignore: avoid_print
                      print('stayOnTop(false)');
                      await DesktopWindow.stayOnTop(false);
                    },
                    child: const Text('stayOnTop(false)'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
