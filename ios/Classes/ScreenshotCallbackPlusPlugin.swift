import Flutter
import UIKit

public class ScreenshotCallbackPlusPlugin: NSObject, FlutterPlugin {
  static var channel: FlutterMethodChannel?
  static var observer: NSObjectProtocol?;
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    channel = FlutterMethodChannel(name: "screenshot_callback_plus", binaryMessenger: registrar.messenger())
    observer = nil
      
    let instance = ScreenshotCallbackPlusPlugin()
    if let channel = channel {
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if(call.method == ScreenshotCallbackPlusMethods.initialize){
          if(ScreenshotCallbackPlusPlugin.observer != nil) {
              NotificationCenter.default.removeObserver(ScreenshotCallbackPlusPlugin.observer!);
              ScreenshotCallbackPlusPlugin.observer = nil;
          }
          ScreenshotCallbackPlusPlugin.observer = NotificationCenter.default.addObserver(
            forName: UIApplication.userDidTakeScreenshotNotification,
            object: nil,
            queue: .main) { notification in
            if let channel = ScreenshotCallbackPlusPlugin.channel {
                channel.invokeMethod(ScreenshotCallbackPlusMethods.onCallback, arguments: nil)
            }

            result("screen shot called")
        }
        result("initialize")
      }else if(call.method == ScreenshotCallbackPlusMethods.dispose){
          if(ScreenshotCallbackPlusPlugin.observer != nil) {
              NotificationCenter.default.removeObserver(ScreenshotCallbackPlusPlugin.observer!);
              ScreenshotCallbackPlusPlugin.observer = nil;
          }
          result("dispose")
      }else{
        result("")
      }
  }
    
    deinit {
          if(ScreenshotCallbackPlusPlugin.observer != nil) {
              NotificationCenter.default.removeObserver(ScreenshotCallbackPlusPlugin.observer!);
              ScreenshotCallbackPlusPlugin.observer = nil;
          }
      }
}
