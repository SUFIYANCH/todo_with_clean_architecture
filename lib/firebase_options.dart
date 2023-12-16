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
    apiKey: 'AIzaSyAasMcYUpdKEFBEH6mnC5zPZuPWTThv0qE',
    appId: '1:878937168452:web:d33acaf347961cc0e0ba11',
    messagingSenderId: '878937168452',
    projectId: 'cleanarchtodo',
    authDomain: 'cleanarchtodo.firebaseapp.com',
    storageBucket: 'cleanarchtodo.appspot.com',
    measurementId: 'G-64SCTL7WTD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQUJbhpBTnmlQnIgzfhff5ABMVt7OWm1Q',
    appId: '1:878937168452:android:3634050db4e32588e0ba11',
    messagingSenderId: '878937168452',
    projectId: 'cleanarchtodo',
    storageBucket: 'cleanarchtodo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtbtHvZg36cI4cd69esavJTRAACRO_zFo',
    appId: '1:878937168452:ios:fd587193035e2e2ee0ba11',
    messagingSenderId: '878937168452',
    projectId: 'cleanarchtodo',
    storageBucket: 'cleanarchtodo.appspot.com',
    iosBundleId: 'com.example.todoWithCleanArchitecture',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtbtHvZg36cI4cd69esavJTRAACRO_zFo',
    appId: '1:878937168452:ios:4ec015b8d5d5867be0ba11',
    messagingSenderId: '878937168452',
    projectId: 'cleanarchtodo',
    storageBucket: 'cleanarchtodo.appspot.com',
    iosBundleId: 'com.example.todoWithCleanArchitecture.RunnerTests',
  );
}