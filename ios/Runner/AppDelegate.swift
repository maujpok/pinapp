import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, CommentsApi {
  var flutterViewController: FlutterViewController!

  var engine: FlutterEngine = {
    let result = FlutterEngine.init()
    result.run()
    return result
  }()

  func fetchComments(postId: Int64, completion: @escaping (Result<[CommentModel], Error>) -> Void) {
    let api = CommentsApiImpl()
    api.fetchComments(postId: postId) { (comments) in
      completion(comments)
    }
  }

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    flutterViewController = (window.rootViewController as? FlutterViewController)
    CommentsApiSetup.setUp(binaryMessenger: flutterViewController as! FlutterBinaryMessenger, api: self)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
