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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjzxQqqUmWheCFsfsGlxaLSrHTACynJLU',
    appId: '1:152974899925:android:107b7245c7d6226a75005c',
    messagingSenderId: '152974899925',
    projectId: 'multicamdemo-f11b0',
    databaseURL: 'https://multicamdemo-f11b0.firebaseio.com',
    storageBucket: 'multicamdemo-f11b0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwjIw0tYSZ4zRy8jmXZpFuB9KcML4nv_A',
    appId: '1:152974899925:ios:f5601a786bc8b16675005c',
    messagingSenderId: '152974899925',
    projectId: 'multicamdemo-f11b0',
    databaseURL: 'https://multicamdemo-f11b0.firebaseio.com',
    storageBucket: 'multicamdemo-f11b0.appspot.com',
    iosClientId: '152974899925-03phpvcbmovarj2jbgo4ce18685bag38.apps.googleusercontent.com',
    iosBundleId: 'com.example.multiCamDashboard',
  );
}
