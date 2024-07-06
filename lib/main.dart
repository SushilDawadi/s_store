import 'package:flutter/material.dart';
import 'package:s_store/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:s_store/firebase_options.dart';

Future<void> main() async {
  //initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(FirebaseApp value) => Get.put(AuthenticationRepository());
  runApp(const MyApp());
}
