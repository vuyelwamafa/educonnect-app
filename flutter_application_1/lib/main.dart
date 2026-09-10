import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Keep this import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Load your hidden .env file before initializing Firebase
  await dotenv.load(fileName: ".env"); 

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        // 2. Safely read the key from your .env file instead of hardcoding it
        apiKey: dotenv.env['FIREBASE_WEB_API_KEY'] ?? '', 
        authDomain: "cutnavigatorapp.firebaseapp.com",
        projectId: "cutnavigatorapp",
        storageBucket: "cutnavigatorapp.firebasestorage.app",
        messagingSenderId: "1088208887074",
        appId: "1:1088208887074:web:3511f5b9296907e852d97b",
        measurementId: "G-1RFXVHGBV7",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      title: 'Flutter Demo',
      initialRoute: RouteManager.login_page,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
