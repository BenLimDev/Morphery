import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/C.dart/formatC.dart';

int index = 18;
String titleText = 'In-depth mode';
String? img1 
= 'img/pg2.1.jpg'
;
String txt1 =
"Ex: Here shows two situations during a Physical Education lesson. In both situations, the teacher instructs his pupils to run a distance of 50 metres. What is the difference between situation 1 and situation 2?";
String? img2 
//= 'img/pg2.2.jpg'
;
String txt2 =
//"Vector quantities: Displacement, Velocity, Force, Acceleration, Momentum";
"";


class C18 extends StatefulWidget {
  const C18({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<C18> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<C18> {
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