import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/B.dart/formatB.dart';

int index = 18;
String titleText = 'Regular mode';
String? img1 
= 'img/pg10.1 11.1 12.1 13.1 14.1 15.1.jpg'
;
String txt1 =
"6.	Type of graph: • A curve with a negative gradient that does not cut both axes \n • A straight line y against 1/ x with a positive gradient that passes through origin  \nInterpretation of graph: \n• y is inversely proportional to x";
String? img2 
= 'img/pg15.2.jpg'
;
String txt2 =
//"1.	Type of graph: A straight line that passes through the origin\nInterpretation of graph:\n• y is directly proportional to x\n• Gradient of graph, m = Δy/ Δx  ,m = y2 – y1/ x2 – x1 \n• Linear equation, y = mx";
"";

class B18 extends StatefulWidget {
  const B18({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<B18> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<B18> {
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