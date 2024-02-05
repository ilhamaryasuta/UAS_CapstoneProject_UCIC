// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDe65w9EZ3wfXsd688_dfcv_8G-GdWW2wM',
    appId: '1:1027833663753:web:ffa1074250ad15855103d8',
    messagingSenderId: '1027833663753',
    projectId: 'projectuas-8ad68',
    authDomain: 'projectuas-8ad68.firebaseapp.com',
    storageBucket: 'projectuas-8ad68.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqQDugNaq1vTbxN950DVpy8C8LIZ-1t5s',
    appId: '1:1027833663753:android:741f7b36a41710a25103d8',
    messagingSenderId: '1027833663753',
    projectId: 'projectuas-8ad68',
    storageBucket: 'projectuas-8ad68.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCkttbSoeQI6Ay3npqhgr1HJtk4EfGuczw',
    appId: '1:1027833663753:ios:1f4a49f7e19898185103d8',
    messagingSenderId: '1027833663753',
    projectId: 'projectuas-8ad68',
    storageBucket: 'projectuas-8ad68.appspot.com',
    iosBundleId: 'com.example.projectuas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCkttbSoeQI6Ay3npqhgr1HJtk4EfGuczw',
    appId: '1:1027833663753:ios:699021af043a253a5103d8',
    messagingSenderId: '1027833663753',
    projectId: 'projectuas-8ad68',
    storageBucket: 'projectuas-8ad68.appspot.com',
    iosBundleId: 'com.example.projectuas.RunnerTests',
  );
}
