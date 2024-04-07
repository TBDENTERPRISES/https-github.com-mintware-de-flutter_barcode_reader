import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyApYdEqpPUwicOX7pSrLrlR1fO9oSYVECs",
            authDomain: "social-37103.firebaseapp.com",
            projectId: "social-37103",
            storageBucket: "social-37103.appspot.com",
            messagingSenderId: "810073980279",
            appId: "1:810073980279:web:0f32b988120f8ee563b572",
            measurementId: "G-ZC7X6599GC"));
  } else {
    await Firebase.initializeApp();
  }
}
