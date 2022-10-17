import 'package:flutter/material.dart';
import 'package:m_hany_store/core/app.dart';
import 'package:m_hany_store/core/routes/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:m_hany_store/firebase_options.dart';


//6610f2
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp( App(routes: Routes(),));
  
}
