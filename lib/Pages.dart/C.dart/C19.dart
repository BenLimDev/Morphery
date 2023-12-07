import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/C.dart/formatC.dart';

int index = 19;
String titleText = 'In-depth mode';
String? img1 
= 'img/rpg12.1.jpg'
;
String txt1 =
"Situation 1: Pupils, please listen to my instructions -> Run a distance of 50 metres.";
String? img2 
= 'img/rpg12.2.jpg'
;
String txt2 =
"Situation 2: Pupils, please listen to my instructions -> Run a distance of 50 metres towards that tree.";
//"";


class C19 extends StatefulWidget {
  const C19({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<C19> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<C19> {
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