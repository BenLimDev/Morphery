import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/A.dart/formatA.dart';

int index = 4;
String titleText = 'Simplified mode';
String? img1 
= 'img/pg3.2.jpg'
;
String txt1 =
"Base quantity and its symbol : \nLength,l  Mass,m  Time,t  Thermodynamic temperature,T  \nElectric current,I  Luminous intensity, I  Amount of substance,n";
String? img2 
= 'img/pg3.1.jpg'
;
String txt2 =
//"";
"";

class A4 extends StatefulWidget {
  const A4({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<A4> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<A4> {
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