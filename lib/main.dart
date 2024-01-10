import 'package:Morphery/homepage.dart';
import 'package:Morphery/chat_screen.dart';
import 'package:Morphery/route_generator.dart';
import 'package:flutter/material.dart';

void main() async {
runApp(const Morphery());
}

class Morphery extends StatelessWidget {
const Morphery({super.key});

@override
Widget build(BuildContext context) {
	return MaterialApp(
	initialRoute: '/',
  onGenerateRoute: (settings) => getPageRoute(settings),
   routes:{
   '/chat_screen': (context) => ChatScreen(),
   '/': (context) => homeScreen(),
   },
	debugShowCheckedModeBanner: false,
	);
}
}
