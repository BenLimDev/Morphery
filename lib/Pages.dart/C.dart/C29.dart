import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/C.dart/formatC.dart';

int index = 29;
String titleText = 'In-depth mode';
String? img1 
= 'img/rpg21.1.jpg'
;
String txt1 =
"4.	The interpolation to determine the value of a physical quantity. \nMethod: If the value of x is given, determine the value of y using interpolation and vice versa.\n5.	The extrapolation to make a prediction. \nMethod: 1. Extrapolate the graph. \n                 2. Determine the value of x or y concerned.";
String? img2 
= 'img/rpg21.2.jpg'
;
String txt2 =
//"";
"";

class C29 extends StatefulWidget {
  const C29({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<C29> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<C29> {
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
    return formatC(
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