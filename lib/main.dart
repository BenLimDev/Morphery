import 'package:Morphery/homepage.dart';
import 'package:Morphery/chat_screen.dart';
import 'package:Morphery/route_generator.dart';
import 'package:flutter/material.dart';

void main() async {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
	return MaterialApp(
	initialRoute: '/',
  onGenerateRoute: (settings) => getPageRoute(settings),
   routes:{
   '/chat_screen': (context) => const ChatScreen(),
   '/': (context) => homeScreen(),
   },
	debugShowCheckedModeBanner: false,
	);
}
}
