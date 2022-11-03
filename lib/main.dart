import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/app.dart';
import 'package:m_hany_store/core/routes/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:m_hany_store/firebase_options.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  // ignore: avoid_print
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp( App(routes: Routes(),));
}
