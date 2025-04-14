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
    apiKey: 'AIzaSyDbMTORnsENotBr8K0pq-yxwAvTKMpi408',
    appId: '1:685003362427:web:a7dc0474bc58fbfd2892de',
    messagingSenderId: '685003362427',
    projectId: 'gardone-a8a1d',
    authDomain: 'gardone-a8a1d.firebaseapp.com',
    storageBucket: 'gardone-a8a1d.firebasestorage.app',
    measurementId: 'G-S2HBS28S9C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJ5vWw86UK6bMfMbvIznvYpmrx6Xm-sB8',
    appId: '1:685003362427:android:4c64ebce853a25e92892de',
    messagingSenderId: '685003362427',
    projectId: 'gardone-a8a1d',
    storageBucket: 'gardone-a8a1d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjMRp-Hge_H7mwFsEWRSJ16ygPrr1XolI',
    appId: '1:685003362427:ios:3d5a9597771c1e882892de',
    messagingSenderId: '685003362427',
    projectId: 'gardone-a8a1d',
    storageBucket: 'gardone-a8a1d.firebasestorage.app',
    androidClientId: '685003362427-36i72pan9tnlahmicqp2murnclti5v1i.apps.googleusercontent.com',
    iosClientId: '685003362427-dqqldkf6speks0gcq58t7odpqf7pb1um.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAjMRp-Hge_H7mwFsEWRSJ16ygPrr1XolI',
    appId: '1:685003362427:ios:3d5a9597771c1e882892de',
    messagingSenderId: '685003362427',
    projectId: 'gardone-a8a1d',
    storageBucket: 'gardone-a8a1d.firebasestorage.app',
    androidClientId: '685003362427-36i72pan9tnlahmicqp2murnclti5v1i.apps.googleusercontent.com',
    iosClientId: '685003362427-dqqldkf6speks0gcq58t7odpqf7pb1um.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDbMTORnsENotBr8K0pq-yxwAvTKMpi408',
    appId: '1:685003362427:web:5e923bfdb998d6692892de',
    messagingSenderId: '685003362427',
    projectId: 'gardone-a8a1d',
    authDomain: 'gardone-a8a1d.firebaseapp.com',
    storageBucket: 'gardone-a8a1d.firebasestorage.app',
    measurementId: 'G-17B232BC87',
  );

}