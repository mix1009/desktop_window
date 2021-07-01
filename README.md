# desktop_window

Flutter plugin for Flutter desktop(macOS/Linux/Windows) to change window size.


## Usage
```
import 'package:desktop_window/desktop_window.dart';

Future testWindowFunctions() async {
    Size size = await DesktopWindow.getWindowSize();
    print(size);
    await DesktopWindow.setWindowSize(Size(500,500));

    await DesktopWindow.setMinWindowSize(Size(400,400));
    await DesktopWindow.setMaxWindowSize(Size(800,800));

    await DesktopWindow.resetMaxWindowSize();
    await DesktopWindow.toggleFullScreen();
    bool isFullScreen = await DesktopWindow.getFullScreen();
    await DesktopWindow.setFullScreen(true);
    await DesktopWindow.setFullScreen(false);
    bool hasBorders = await DesktopWindow.hasBorders;
    await DesktopWindow.setBorders(false);
    await DesktopWindow.setBorders(true);
    await DesktopWindow.toggleBorders();
    await DesktopWindow.focus();
}
```


## Contributers

Linux support has been contributed by Justus Fluegel (https://github.com/JustusFluegel)

