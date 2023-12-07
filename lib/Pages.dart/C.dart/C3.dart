import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/C.dart/formatC.dart';

int index = 3;
String titleText = 'In-depth mode';
String? img1 
= 'img/ipg3.1.jpg'
;
String txt1 =
"2.	National Paralympic athlete, Mohamad Ridzuan Puzi created a world record with a recorded time of 11.87 s in the 100 m sprint event (T36 category) in the 2018 Asian Para Games. ";
String? img2 
= 'img/ipg3.2.jpg'
;
String txt2 =
"3.	Speed of the tiger, Panthera tigris is 49 km h–1 to 65 km h–1. ";
//"";


class C3 extends StatefulWidget {
  const C3({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<C3> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<C3> {
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