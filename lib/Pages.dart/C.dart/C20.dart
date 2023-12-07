import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/C.dart/formatC.dart';

int index = 20;
String titleText = 'In-depth mode';
String? img1 
= 'img/ipg20.1.jpg'
;
String txt1 =
"Carrer info! : Metrology is a scientific study of measurements and standards. Many scientists apply advanced technologies of measurements to determine the standards of fundamental units. In Malaysia, Standard and Industrial Research Institute of Malaysia (SIRIM) is responsible to prepare the standards of all measurements.";
String? img2 
= 'img/ipg20.2.jpg'
;
String txt2 =
//"";
"";

class C20 extends StatefulWidget {
  const C20({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<C20> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<C20> {
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