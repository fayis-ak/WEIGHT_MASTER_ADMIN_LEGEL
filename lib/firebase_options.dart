// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBuAOSbp9TelyDFgExDzEsYlsU62w4xECU',
    appId: '1:263132398388:web:197d61b14f1f342cd1db61',
    messagingSenderId: '263132398388',
    projectId: 'weigh-master-b7694',
    authDomain: 'weigh-master-b7694.firebaseapp.com',
    storageBucket: 'weigh-master-b7694.appspot.com',
    measurementId: 'G-P2WJ5TPGQQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4DxIxiDTQ3vblhd3p4ba0ka2X75YCugc',
    appId: '1:263132398388:android:77ada927b3171210d1db61',
    messagingSenderId: '263132398388',
    projectId: 'weigh-master-b7694',
    storageBucket: 'weigh-master-b7694.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgNWKGUQH0aBudWtrTDkiDT6l7TVGW_vA',
    appId: '1:263132398388:ios:1940e6cac4b742f2d1db61',
    messagingSenderId: '263132398388',
    projectId: 'weigh-master-b7694',
    storageBucket: 'weigh-master-b7694.appspot.com',
    iosBundleId: 'com.example.weighMasterAdmin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgNWKGUQH0aBudWtrTDkiDT6l7TVGW_vA',
    appId: '1:263132398388:ios:1940e6cac4b742f2d1db61',
    messagingSenderId: '263132398388',
    projectId: 'weigh-master-b7694',
    storageBucket: 'weigh-master-b7694.appspot.com',
    iosBundleId: 'com.example.weighMasterAdmin',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBuAOSbp9TelyDFgExDzEsYlsU62w4xECU',
    appId: '1:263132398388:web:db22a9c5abddac6ad1db61',
    messagingSenderId: '263132398388',
    projectId: 'weigh-master-b7694',
    authDomain: 'weigh-master-b7694.firebaseapp.com',
    storageBucket: 'weigh-master-b7694.appspot.com',
    measurementId: 'G-FBHXXKYBZL',
  );
}
