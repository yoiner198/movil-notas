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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyAil3GR-Vcg3TrgeDr8zmKJ8lQwQ_2JQd0",
      authDomain: "first-a678e.firebaseapp.com",
      projectId: "first-a678e",
      storageBucket: "first-a678e.appspot.com",
      messagingSenderId: "694253644677",
      appId: "1:694253644677:web:a886c0f66c19d6ff9af2ec");

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyAil3GR-Vcg3TrgeDr8zmKJ8lQwQ_2JQd0",
      authDomain: "first-a678e.firebaseapp.com",
      projectId: "first-a678e",
      storageBucket: "first-a678e.appspot.com",
      messagingSenderId: "694253644677",
      appId: "1:694253644677:web:a886c0f66c19d6ff9af2ec");
}