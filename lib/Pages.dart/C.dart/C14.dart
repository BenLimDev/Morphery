import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/C.dart/formatC.dart';

int index = 14;
String titleText = 'In-depth mode';
String? img1 
= 'img/ipg14.1.jpg'
;
String txt1 =
"Info file! :\n1.	Amount of substance normally used in Chemistry refers to the quantity of an element or a compound.";
String? img2 
= 'img/ipg14.2.jpg'
;
String txt2 =
//"2.	In 1960, International System of Units known as S.I. was agreed upon at the 11th General Conference on Weights and Measures (Conférence Générale des Poids et Mesures, CGPM) in Paris, France. This system has facilitated works in the fi elds of science, sports, trade, medicine and others.";
"";

class C14 extends StatefulWidget {
  const C14({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<C14> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<C14> {
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