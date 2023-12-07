import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/A.dart/formatA.dart';
int index = 7;
String titleText = 'Simplified mode';
String? img1 
= 'img/pg6.2 7.1.jpg'
;
String txt1 =
"Derived quantity,its symbol and formula:\nVolume, V ,V = l ^0033\nDensity, ρ ,ρ = m/V\nVelocity, v ,v = l/t\nCharge, Q ,Q = I × t";
String? img2 
= 'img/pg6.1 7.2.jpg'
;
String txt2 =
//"";
"";

class A7 extends StatefulWidget {
  const A7({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<A7> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<A7> {
  late TextEditingController textController1;
  late TextEditingController textController2;
  String userStyle = ''; 
  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController(text: txt1);
    textController2 = TextEditingController(text: txt2);
    receiveStyle();}

  void receiveStyle() {
    final String? receivedStyle = widget.lockedStyle;
    if (receivedStyle != null) {
      setState(() {
        userStyle = receivedStyle;
      });
    }
  }

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return formatA(
      textController1: textController1,
      textController2: textController2,
      currentIndex: index,
      userStyle: userStyle,
      titleText: titleText,
      imagePath1: img1,
      imagePath2: img2,
    );
  }
}