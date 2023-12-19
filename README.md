<h1 align="center">Screenshot Callback Plus</h1>
<h4 align="center">
  Flutter plugin that allows you to detect screenshot and execute callback functions. 🚀
</h4>

<p align="center">
  <a href="#usage">Usage</a> •
  <a href="#issues-and-feedback">Issues and Feedback</a> •
  <a href="#author">Author</a> •
  <a href="#license">License</a>
</p>

> [Feedback welcome](https://github.com/chandrabezzo/screenshot_callback_plus/issues/new) and [Pull Requests](https://github.com/chandrabezzo/screenshot_callback_plus/pulls) are most welcome!

## Usage

### Import the package

To use this plugin, follow the [**plugin installation instructions**](https://pub.dev/packages/screenshot_callback_plus#-installing-tab-).

### Use the plugin

Add the following import to your Dart code:

```dart
import 'package:screenshot_callback_plus/screenshot_callback_plus.dart';
```

Initialize ScreenshotCallbackPlus with the scopes you want:

```dart
ScreenshotCallbackPlus screenshotCallback = ScreenshotCallbackPlus();
```

### addListener

Then invoke <code>addListener</code> method of <code>ScreenshotCallback</code>.
Add custom functions that you want to excute after detect screenshot. e.g:

```dart
screenshotCallback.addListener(() {
  //Void funtions are implemented
  print('detect screenshot');
});
```

### dispose

You need to call <code>dispose</code> method to terminate <code>ScreenshotCallback</code> before you exit the app e.g:

```dart
screenshotCallback.dispose();
```

## Issues and Feedback

Please [**file**](https://github.com/chandrabezzo/screenshot_callback_plus/issues/new) issues to send feedback or report a bug. Thank you !

## Author

- [Gwangyu-Kim](https://github.com/kwanguuuu) • <kwangyu326@gmail.com>
- [minsub0922](https://github.com/minsub0922) • <minsub0922@naver.com>
- [beygee](https://github.com/beygee) • <doug0476@naver.com>
- [Flutter Moum](https://github.com/flutter-moum) • <fluttermoum@gmail.com>
- [Chandra Abdul Fattah](https://github.com/chandrabezzo) • <chandrashibezzo@gmail.com>

## License

MIT