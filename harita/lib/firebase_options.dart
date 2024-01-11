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
    apiKey: 'AIzaSyCvObdhPB_IGhGXYX2MwDPqmRbclnmQ8zg',
    appId: '1:22262859018:web:ffce172e1458837cf426f3',
    messagingSenderId: '22262859018',
    projectId: 'haritapro-f74b5',
    authDomain: 'haritapro-f74b5.firebaseapp.com',
    storageBucket: 'haritapro-f74b5.appspot.com',
    measurementId: 'G-KD7KVF06TJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDabwXalEAWRPN2zM7-Z5foKYjo9whmX1w',
    appId: '1:22262859018:android:49a1a5b8a363bdf0f426f3',
    messagingSenderId: '22262859018',
    projectId: 'haritapro-f74b5',
    storageBucket: 'haritapro-f74b5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQffDSIuSTJhwkjK2250_k2rDzN4cApOY',
    appId: '1:22262859018:ios:8c3957176a433db6f426f3',
    messagingSenderId: '22262859018',
    projectId: 'haritapro-f74b5',
    storageBucket: 'haritapro-f74b5.appspot.com',
    iosBundleId: 'com.example.harita',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBQffDSIuSTJhwkjK2250_k2rDzN4cApOY',
    appId: '1:22262859018:ios:3289cb45a7cde46ef426f3',
    messagingSenderId: '22262859018',
    projectId: 'haritapro-f74b5',
    storageBucket: 'haritapro-f74b5.appspot.com',
    iosBundleId: 'com.example.harita.RunnerTests',
  );
}
