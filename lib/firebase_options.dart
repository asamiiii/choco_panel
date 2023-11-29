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
    apiKey: 'AIzaSyBkL852OIQsOfJA_b0DHcViW0CqnS5UY3Y',
    appId: '1:869272810992:web:bb25c205b6362a23255935',
    messagingSenderId: '869272810992',
    projectId: 'choco-sweden',
    authDomain: 'choco-sweden.firebaseapp.com',
    databaseURL: 'https://choco-sweden-default-rtdb.firebaseio.com',
    storageBucket: 'choco-sweden.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBfTbn7FN-oKZiUQMuIil91fhxIisX5BA',
    appId: '1:869272810992:android:e3bb2611c2bd5cd8255935',
    messagingSenderId: '869272810992',
    projectId: 'choco-sweden',
    databaseURL: 'https://choco-sweden-default-rtdb.firebaseio.com',
    storageBucket: 'choco-sweden.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAinogkGIc4D7VwzM_HldKTI4lLmeBwY6o',
    appId: '1:869272810992:ios:2312b9e1095238a9255935',
    messagingSenderId: '869272810992',
    projectId: 'choco-sweden',
    databaseURL: 'https://choco-sweden-default-rtdb.firebaseio.com',
    storageBucket: 'choco-sweden.appspot.com',
    iosBundleId: 'com.example.chocoPanel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAinogkGIc4D7VwzM_HldKTI4lLmeBwY6o',
    appId: '1:869272810992:ios:08f1e62b280ed79b255935',
    messagingSenderId: '869272810992',
    projectId: 'choco-sweden',
    databaseURL: 'https://choco-sweden-default-rtdb.firebaseio.com',
    storageBucket: 'choco-sweden.appspot.com',
    iosBundleId: 'com.example.chocoPanel.RunnerTests',
  );
}