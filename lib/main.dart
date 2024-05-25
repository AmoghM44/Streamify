import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_2/screens/home_screen.dart';
import 'package:zoom_2/screens/login_screen.dart';
import 'package:zoom_2/utils/colors.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
// Future firebaseInitalise()async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
// }
// void main() { // async has to be used
//   firebaseInitalise();
//   runApp(MyApp());
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom_2',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        // '/video-call': (context) => const VideoCallScreen(),
      },
      home: const LoginScreen(),
    );
  }
}

