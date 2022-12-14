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
    apiKey: 'AIzaSyB6j75Vsq8MWchUaRx4Fk6VZ2tHayIm2XM',
    appId: '1:72256966305:web:03da23a3288291f2c32ae0',
    messagingSenderId: '72256966305',
    projectId: 'mohanystore-268dd',
    authDomain: 'mohanystore-268dd.firebaseapp.com',
    storageBucket: 'mohanystore-268dd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCumbuig7yYvy90vEeZXsLkEJJqwvEO7Og',
    appId: '1:72256966305:android:19227cfbcf7a17bdc32ae0',
    messagingSenderId: '72256966305',
    projectId: 'mohanystore-268dd',
    storageBucket: 'mohanystore-268dd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDn6FgCTeivEWjGueEkCN9y1bLKH-kZBV0',
    appId: '1:72256966305:ios:fc5a5962fd39716ec32ae0',
    messagingSenderId: '72256966305',
    projectId: 'mohanystore-268dd',
    storageBucket: 'mohanystore-268dd.appspot.com',
    androidClientId: '72256966305-k9re4g6toodoc2soje2k8dac0f7kn7hh.apps.googleusercontent.com',
    iosClientId: '72256966305-rk80p2g1j63af7t5g2t2c1ge38d7gl3s.apps.googleusercontent.com',
    iosBundleId: 'com.example.moHanySotre',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDn6FgCTeivEWjGueEkCN9y1bLKH-kZBV0',
    appId: '1:72256966305:ios:fc5a5962fd39716ec32ae0',
    messagingSenderId: '72256966305',
    projectId: 'mohanystore-268dd',
    storageBucket: 'mohanystore-268dd.appspot.com',
    androidClientId: '72256966305-k9re4g6toodoc2soje2k8dac0f7kn7hh.apps.googleusercontent.com',
    iosClientId: '72256966305-rk80p2g1j63af7t5g2t2c1ge38d7gl3s.apps.googleusercontent.com',
    iosBundleId: 'com.example.moHanySotre',
  );
}
