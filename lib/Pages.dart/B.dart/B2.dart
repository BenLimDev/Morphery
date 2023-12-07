import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/B.dart/formatB.dart';

int index = 2;
String titleText = 'Regular mode';
String? img1 
= 'img/pg2.1.jpg'
;
String txt1 =
"A physical quantity must be stated in magnitude with its unit.";
String? img2 
= 'img/rpg2.2.jpg'
;
String txt2 =
"Length(physical quantity) = 100(magnitude) m(unit)";
//"";


class B2 extends StatefulWidget {
  const B2({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<B2> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<B2> {
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