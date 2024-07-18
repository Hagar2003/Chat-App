
import 'package:flutter/material.dart';
import 'package:scholar_app/pages/chat_page.dart';
import 'package:scholar_app/pages/login_page.dart';
import 'package:scholar_app/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarApp());
}

class ScholarApp extends StatelessWidget {
  const ScholarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(debugShowCheckedModeBanner: false,
      routes: {'LoginPage':(context) => LoginPage(),
      'RegisterPage':(context) => const RegisterScreen(),
      'ChatPage':(context)=> ChatPage()},
        initialRoute: 'LoginPage'
      
      );
    
  }
}