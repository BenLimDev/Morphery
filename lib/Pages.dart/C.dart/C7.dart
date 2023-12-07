import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/C.dart/formatC.dart';

int index = 7;
String titleText = 'In-depth mode';
String? img1 
= 'img/ipg7.1.jpg'
;
String txt1 =
"Integration of HISTORY! : In 1999, the spaceship Mars Climate Orbiter suddenly disappeared in outer space. This was caused by a mistake in the units of measurement used by the engineers. One group of engineers used the imperial unit while the other used the metric unit. This caused the spaceship to crash onto the surface of Mars.";
String? img2 
= 'img/ipg7.2.jpg'
;
String txt2 =
//"";
"";

class C7 extends StatefulWidget {
  const C7({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<C7> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<C7> {
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