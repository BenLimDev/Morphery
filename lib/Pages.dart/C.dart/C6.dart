import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/C.dart/formatC.dart';

int index = 6;
String titleText = 'In-depth mode';
String? img1 
= 'img/ipg6.1.jpg'
;
String txt1 =
"Other examples of imperial units are gallons, miles, feet and yards. Do you know that imperial units can be converted to metric units and vice versa?";
String? img2 
= 'img/ipg6.2.jpg'
;
String txt2 =
//"Integration of HISTORY! : In 1999, the spaceship Mars Climate Orbiter suddenly disappeared in outer space. This was caused by a mistake in the units of measurement used by the engineers. One group of engineers used the imperial unit while the other used the metric unit. This caused the spaceship to crash onto the surface of Mars.";
"";


class C6 extends StatefulWidget {
  const C6({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<C6> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<C6> {
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