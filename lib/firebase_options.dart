// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB5cWobvpZ_qJ7YKiVBa1EVmjjQjUI9_dI',
    appId: '1:416111299272:web:3702550690a693198873fd',
    messagingSenderId: '416111299272',
    projectId: 'jee-chat-a3d1b',
    authDomain: 'jee-chat-a3d1b.firebaseapp.com',
    storageBucket: 'jee-chat-a3d1b.appspot.com',
    measurementId: 'G-TRG2G67GBF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTrTMjai8Hb2kh3JfCraUlTLHbkYl4Qtw',
    appId: '1:416111299272:android:73c891a29d54a66e8873fd',
    messagingSenderId: '416111299272',
    projectId: 'jee-chat-a3d1b',
    storageBucket: 'jee-chat-a3d1b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAooeAeVne3ijfDbgukD0awrGQaZUtMNM',
    appId: '1:416111299272:ios:f7af98bd7be22fbd8873fd',
    messagingSenderId: '416111299272',
    projectId: 'jee-chat-a3d1b',
    storageBucket: 'jee-chat-a3d1b.appspot.com',
    iosClientId: '416111299272-njmkk6ja93ltcncassum2bmulcqpn62e.apps.googleusercontent.com',
    iosBundleId: 'com.example.jeeChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDAooeAeVne3ijfDbgukD0awrGQaZUtMNM',
    appId: '1:416111299272:ios:f7af98bd7be22fbd8873fd',
    messagingSenderId: '416111299272',
    projectId: 'jee-chat-a3d1b',
    storageBucket: 'jee-chat-a3d1b.appspot.com',
    iosClientId: '416111299272-njmkk6ja93ltcncassum2bmulcqpn62e.apps.googleusercontent.com',
    iosBundleId: 'com.example.jeeChat',
  );
}
