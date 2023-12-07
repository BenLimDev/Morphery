import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/B.dart/formatB.dart';

int index = 1;
String titleText = 'Regular mode';
String? img1 
= 'img/pg1.1.jpg'
;
String txt1 =
"Measurement is a method to determine the value of a physical quantity. Physical quantities consist of base quantities and derived quantities.";
String? img2 
= 'img/pg1.2.jpg'
;
String txt2 =
//"Moreover, physics plays a pivotal role in technological advancements and shaping our understanding of the cosmos. It's the backbone of many scientific fields, driving innovations in engineering, medicine, astronomy, and more. Through rigorous experimentation, mathematical modeling, and theoretical concepts, physicists strive to unravel the mysteries of the universe, making significant strides in our ability to comprehend natural phenomena and pave the way for groundbreaking discoveries and technological breakthroughs.";
"";

class B1 extends StatefulWidget {
  const B1({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<B1> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<B1> {
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
    return formatB(
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