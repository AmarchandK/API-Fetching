import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSService.provideAPIKey("AIzaSyBi_UQgDWvZ_tIChscUi3vsHsSDns2hrko")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
