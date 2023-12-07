import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/A.dart/formatA.dart';

int index = 1;
String titleText = 'Simplified mode';
String? img1 
= 'img/pg1.1.jpg'
;
String txt1 =
"Measurement is a method to determine the value of a physical quantity. Physical quantities consist of base quantities and derived quantities.";
String? img2 
= 'img/pg2.2.jpg'
;
String txt2 =
"";

class A1 extends StatefulWidget {
  const A1({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; // Define argument

  @override
  State<A1> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<A1> {
  late TextEditingController textController1;
  late TextEditingController textController2;
  String userStyle = ''; // Initialize variable

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController(
      text: txt1
    );
    textController2 = TextEditingController(
      text: txt2
    );
    receiveStyle();
  }

  void receiveStyle() {
    final String? receivedStyle = widget.lockedStyle;
    if (receivedStyle != null) {
      setState(() {
        userStyle = receivedStyle;
        print('successfully received: $receivedStyle');
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
    return formatA(
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