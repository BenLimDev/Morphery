import 'package:flutter/material.dart';
import 'package:Morphery/Pages.dart/C.dart/formatC.dart';

int index = 13;
String titleText = 'In-depth mode';
String? img1 
= 'img/rpg8.1.jpg'
;
String txt1 =
"Density(derived quantity) ->  p=m/v(Formlula) -> m/(l*l*l) (in terms of base quantity) -> kg m^-3(S.I. unit)";
String? img2 
= 'img/rpg8.2.jpg'
;
String txt2 =
//"Density(derived quantity) ->  p=m/v(Formlula) -> m/(l*l*l) (in terms of base quantity) -> kg m^-3(S.I. unit)";
"";

class C13 extends StatefulWidget {
  const C13({Key? key, required this.lockedStyle}) : super(key: key);
  final String lockedStyle; 
  @override
  State<C13> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<C13> {
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