import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/A.dart/formatA.dart';

int index = 6;
String titleText = 'Simplified mode';
String? img1 
= 'img/pg6.1 7.2.jpg'
;
String txt1 =
"A derived quantity is related to the base quantities through a formula. The derived unit is related to the base units in a similar manner";
String? img2 
= 'img/pg6.2 7.1.jpg'
;
String txt2 =
//"Look at your ruler. Can you see the units in centimetres and inches on the ruler? Centimetre is an example of a metric unit while inch is an example of an imperial unit.";
"";

class A6 extends StatefulWidget {
  const A6({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<A6> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<A6> {
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