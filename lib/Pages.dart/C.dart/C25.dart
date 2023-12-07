import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/C.dart/formatC.dart';

int index = 25;
String titleText = 'In-depth mode';
String? img1 
= 'img/pg10.1 11.1 12.1 13.1 14.1 15.1.jpg'
;
String txt1 =
"5.	Type of graph: A curve with a negative gradient that does not pass through the origin Interpretation of graph: \n• y decreases with x";
String? img2 
= 'img/pg14.2.jpg'
;
String txt2 =
//"1.	Type of graph: A straight line that passes through the origin\nInterpretation of graph:\n• y is directly proportional to x\n• Gradient of graph, m = Δy/ Δx  ,m = y2 – y1/ x2 – x1 \n• Linear equation, y = mx";
"";

class C25 extends StatefulWidget {
  const C25({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<C25> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<C25> {
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