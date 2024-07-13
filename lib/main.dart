import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:s_store/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:s_store/data/repositories/authentication/authentication_repositories.dart';
import 'package:s_store/firebase_options.dart';

Future<void> main() async {
  //Widgets Bindind to abvoid binding error
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //init local storage
  await GetStorage.init();

  //await splash until other items loaded
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()))
      .catchError((error) {
    print('Firebase initialization error:$error');
  });

  runApp(const MyApp());
}
