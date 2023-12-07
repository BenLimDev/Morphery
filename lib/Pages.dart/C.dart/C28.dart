import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/C.dart/formatC.dart';

int index = 28;
String titleText = 'In-depth mode';
String? img1 
= 'img/rpg20.1.jpg'
;
String txt1 =
"1.	The relationship between two variables. \nMethod: Interpret the shape of graph obtained.\n2.	The gradient of the graph. \nMethod: Calculate the gradient of the graph, m = Δy/ Δx = y2 – y1/ x2 – x1\n3.	The area under the graph. \nMethod: Calculate the area under the graph using the relevant formula for the area.";
String? img2 
= 'img/rpg20.2.jpg'
;
String txt2 =
//"4.	The interpolation to determine the value of a physical quantity. \nMethod: If the value of x is given, determine the value of y using interpolation and vice versa.\n5.	The extrapolation to make a prediction. \nMethod: 1. Extrapolate the graph. \n                 2. Determine the value of x or y concerned.";
"";

class C28 extends StatefulWidget {
  const C28({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<C28> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<C28> {
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