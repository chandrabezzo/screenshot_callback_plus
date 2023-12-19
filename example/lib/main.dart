import 'package:flutter/material.dart';
import 'package:screenshot_callback_plus/screenshot_callback_plus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late ScreenshotCallbackPlus screenshotCallback;

  String text = "Ready..";

  @override
  void initState() {
    super.initState();

    init();
  }

  void init() async {
    await initScreenshotCallback();
  }

  //It must be created after permission is granted.
  Future<void> initScreenshotCallback() async {
    screenshotCallback = ScreenshotCallbackPlus();

    screenshotCallback.addListener(() {
      setState(() {
        text = "Screenshot callback Fired!";
      });
    });

    screenshotCallback.addListener(() {
      debugPrint("We can add multiple listeners ");
    });
  }

  @override
  void dispose() {
    screenshotCallback.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Detect Screenshot Callback Example'),
        ),
        body: Center(
          child: Text(text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
