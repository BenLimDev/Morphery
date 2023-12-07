import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/C.dart/formatC.dart';

int index = 17;
String titleText = 'In-depth mode';
String? img1 
= 'img/pg9.1.jpg'
;
String txt1 =
"Scalar quantities: Distance, Time, Area, Volume, Length, Speed, Work, Energy, Temperature, Density";
String? img2 
= 'img/pg8.1 9.2.jpg'
;
String txt2 =
"Vector quantities: Displacement, Velocity, Force, Acceleration, Momentum";
//"";


class C17 extends StatefulWidget {
  const C17({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<C17> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<C17> {
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