import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class DesktopWindow {
  static const MethodChannel _channel = const MethodChannel('desktop_window');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future getWindowSize() async {
    final arr = await _channel.invokeMethod('getWindowSize');
    if (arr is List && arr.length == 2) {
      return Size(arr[0], arr[1]);
    }
  }

  static Future setWindowSize(Size size) async {
    return await _channel.invokeMethod(
        'setWindowSize', {'width': size.width, 'height': size.height});
  }
}
