import Cocoa
import FlutterMacOS

public class DesktopWindowPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "desktop_window", binaryMessenger: registrar.messenger)
    let instance = DesktopWindowPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    case "getWindowSize":
        if let window = NSApplication.shared.mainWindow {
            let width = window.frame.size.width;
            let height = window.frame.size.height;
            result([width, height])
        } else {
            result("mainWindow not found") // should return error or throw exception here.
        }
            
    case "setWindowSize":
        if let window = NSApplication.shared.mainWindow {
            if let width: Float = (call.arguments as? [String: Any])?["width"] as? Float,
                let height: Float = (call.arguments as? [String: Any])?["height"] as? Float
                {
                    var rect = window.frame;
                    rect.origin.y += (rect.size.height - CGFloat(height));
                    rect.size.width = CGFloat(width);
                    rect.size.height = CGFloat(height);

                    window.setFrame(rect, display: true)
                
            }

            result(true)
        } else {
            result("mainWindow not found") // should return error or throw exception here.
        }

    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
