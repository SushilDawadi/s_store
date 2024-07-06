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
    apiKey: 'AIzaSyCD8Av8Z2GamoZLKH22Xy2V3ULPHU-Q7BY',
    appId: '1:431973417834:web:8530a8040153039d019b13',
    messagingSenderId: '431973417834',
    projectId: 'fir-store-8fbf2',
    authDomain: 'fir-store-8fbf2.firebaseapp.com',
    storageBucket: 'fir-store-8fbf2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYTOFwb_jo-PL-PZ_bKFRLjwtnxqpWcQg',
    appId: '1:431973417834:android:6bb79c81362d5776019b13',
    messagingSenderId: '431973417834',
    projectId: 'fir-store-8fbf2',
    storageBucket: 'fir-store-8fbf2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2oaUGjjE8-8WEsJpAnZW0lAETuuMFf2A',
    appId: '1:431973417834:ios:040ba4904ea91507019b13',
    messagingSenderId: '431973417834',
    projectId: 'fir-store-8fbf2',
    storageBucket: 'fir-store-8fbf2.appspot.com',
    iosBundleId: 'com.example.sStore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2oaUGjjE8-8WEsJpAnZW0lAETuuMFf2A',
    appId: '1:431973417834:ios:040ba4904ea91507019b13',
    messagingSenderId: '431973417834',
    projectId: 'fir-store-8fbf2',
    storageBucket: 'fir-store-8fbf2.appspot.com',
    iosBundleId: 'com.example.sStore',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCD8Av8Z2GamoZLKH22Xy2V3ULPHU-Q7BY',
    appId: '1:431973417834:web:7ddc4dd2f2923eef019b13',
    messagingSenderId: '431973417834',
    projectId: 'fir-store-8fbf2',
    authDomain: 'fir-store-8fbf2.firebaseapp.com',
    storageBucket: 'fir-store-8fbf2.appspot.com',
  );
}
