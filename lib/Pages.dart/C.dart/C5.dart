import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/C.dart/formatC.dart';

int index = 5;
String titleText = 'In-depth mode';
String? img1 
= 'img/pg2.2.jpg'
;
String txt1 =
"Look at your ruler. Can you see the units in centimetres and inches on the ruler? Centimetre is an example of a metric unit while inch is an example of an imperial unit.";
String? img2 
= 'img/rpg3.2.jpg'
;
String txt2 =
"Nowadays we are more familiar with the metric units. Tyre pressure gauge is an example that will display both the metric unit and the imperial unit.";
//"";
class C5 extends StatefulWidget {
  const C5({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<C5> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<C5> {
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