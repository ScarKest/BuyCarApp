// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members, no_default_cases
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
    apiKey: 'AIzaSyBkjGPX3TUjVnMu7-OdIly4a27Wk10X-Nk',
    appId: '1:687121477978:web:59b838f525c85e7a3ac363',
    messagingSenderId: '687121477978',
    projectId: 'scarkest-personal-projects',
    authDomain: 'scarkest-personal-projects.firebaseapp.com',
    databaseURL: 'https://scarkest-personal-projects-default-rtdb.firebaseio.com',
    storageBucket: 'scarkest-personal-projects.appspot.com',
    measurementId: 'G-X26QR4951M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-B_0y1Z3x2qZVy1Y-67u7L6tZ9vOh4co',
    appId: '1:687121477978:android:a8ab52d89bb7284d3ac363',
    messagingSenderId: '687121477978',
    projectId: 'scarkest-personal-projects',
    databaseURL: 'https://scarkest-personal-projects-default-rtdb.firebaseio.com',
    storageBucket: 'scarkest-personal-projects.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfdcqMU2lcdkpIOTBbtLdVUDagmRVSuKk',
    appId: '1:687121477978:ios:5d19b54dec2794ae3ac363',
    messagingSenderId: '687121477978',
    projectId: 'scarkest-personal-projects',
    databaseURL: 'https://scarkest-personal-projects-default-rtdb.firebaseio.com',
    storageBucket: 'scarkest-personal-projects.appspot.com',
    iosClientId: '687121477978-1p3c8l9pbki4bic0090unjq9dc10e5sg.apps.googleusercontent.com',
    iosBundleId: 'com.scarkest.buycar',
  );
}
