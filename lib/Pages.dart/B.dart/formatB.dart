import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math';
import 'dart:async';

FlutterTts flutterTts = FlutterTts();
Future<void> configureTts(double speechRate) async {
await flutterTts.setLanguage('en-US');
await flutterTts.setSpeechRate(speechRate);
await flutterTts.setVolume(1.0);
}

class formatB extends StatefulWidget {
  final TextEditingController textController1;
  final TextEditingController textController2;
  final int currentIndex;
  final String userStyle;
  final String titleText;
  final String? imagePath1;
  final String? imagePath2;

  formatB({
    Key? key,
    required this.textController1,
    required this.textController2,
    required this.currentIndex,
    required this.userStyle,
    required this.titleText,
    this.imagePath1,
    this.imagePath2,
  }) : super(key: key);

  @override
  State<formatB> createState() => _formatBState();
}

class _formatBState extends State<formatB> {
  int shake = 0;
  bool hasNavigated = false;
  final double shakeThreshold = 11.0; 
  //store accelerometer data
  List<AccelerometerEvent> _accelerometerValues = [];
  // StreamSubscription for accelerometer events
  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;
  @override
  void initState() {
    super.initState();
    // Subscribe to accelerometer events
    _accelerometerSubscription = accelerometerEvents.listen((event) {
      setState(() {
        // Update the _accelerometerValues with the latest event
        _accelerometerValues = [event];
        // Check for a shake using the detected acceleration magnitude
        detectShake(event);
      });
    });
  }

  @override
  void dispose() {
    // Cancel the accelerometer event subscription to prevent memory leaks
    _accelerometerSubscription.cancel();
    super.dispose();
  }

  void detectShake(AccelerometerEvent event) {
    double accelerationMagnitude =
        sqrt(pow(event.x, 2.5) + pow(event.y, 2) + pow(event.z, 2));

    if (accelerationMagnitude > shakeThreshold) {
      // Increment the shake counter
      setState(() {
        shake++;
      });
      print('shake: $shake');
      
    }
  }


  @override
  Widget build(BuildContext context) {
    int initialShake;
    int maxIndex = 21;
    int goIndex = widget.currentIndex;
    final double screenHeight = MediaQuery.of(context).size.height;
    bool hasShaken = false;
    Timer? shakeCheckTimer;

  @override
  void dispose() {
    shakeCheckTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }
    
 void checkShake(int initialShake, String selectedText) {
  print('1shake:$shake inishake:$initialShake hasShaken:$hasShaken');
  if (shake > initialShake && !hasShaken) {
    setState(() {
      hasShaken = true;
    });
    Navigator.pushNamed(
      context,
      '/chat_screen',
      arguments: selectedText, 
    );
    initialShake = shake + 1;
  } else {
    print('Device has not been shaken yet.');
  }
}

  void helpButton(BuildContext context, TextSelection selection, String text, String userStyle, int initialShake) {
  String selectedText = text.substring(selection.start, selection.end);
  if (userStyle == 'K'){
    shakeCheckTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
        checkShake(initialShake, selectedText);
      });
  }
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(12), // Adjust the value for the desired roundness
              color: const Color.fromRGBO(255, 205, 0, 1), // Optional: Set the background color
            ),
          child: Column(
            children: [
              ListTile(
                title: Text("\"$selectedText\" "),
                subtitle: userStyle == 'K'? const Text("Shake for explanation"): const Text("Tap for explanation"),
                titleTextStyle: const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Signika', color: Color.fromRGBO(32, 44, 89, 1), fontSize: 18,),
                subtitleTextStyle: const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Signika', color: Color.fromRGBO(32, 44, 89, 1), fontSize: 18,),
                onTap: () {
                  if (userStyle != 'K') 
                    {Navigator.pushNamed(
                    context,
                    '/chat_screen',
                    arguments: selectedText, // Pass the selected text as arguments
                  );}
                },
              ),

              if (userStyle == 'A')
              ListTile(
                title: Text("\"$selectedText\" "),
                subtitle: const Text("Tap for speech-to-text"),
                titleTextStyle: const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Signika', color: Color.fromRGBO(32, 44, 89, 1), fontSize: 18,),
                subtitleTextStyle: const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Signika', color: Color.fromRGBO(32, 44, 89, 1), fontSize: 18,),
                //tileColor: const Color.fromRGBO(255, 223, 194, 43),
                onTap: () async {
                  print('read $selectedText');
                  await flutterTts.speak(selectedText);
                },
              ), 

              if (userStyle == 'A')
              ListTile(
                title: const Text("Read whole page"),
                subtitle: const Text("Tap for speech-to-text"),
                titleTextStyle: const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Signika', color: Color.fromRGBO(32, 44, 89, 1), fontSize: 18,),
                subtitleTextStyle: const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Signika', color: Color.fromRGBO(32, 44, 89, 1), fontSize: 18,),
                //tileColor: const Color.fromRGBO(255, 223, 194, 43),
                onTap: () async {
                  print('read $text');
                  await configureTts(0.5);
                  await flutterTts.speak(text);
                },
              ), 

            ]
          )
          )
          )
        ],
      );
    },
  );

  
  
  }
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 223, 194, 1),
      appBar: AppBar(
        toolbarHeight: 56, //H1
        elevation: 0.0,
        title: Text(
          widget.titleText,
          style: const TextStyle(
            fontSize: 25,
            fontFamily: 'Signika',
            color: Color.fromRGBO(32, 44, 89, 1),
          ),
        ),
        backgroundColor: const Color.fromRGBO(255, 184, 51, 1),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          if (widget.imagePath1 != null) // Display first image if available
            Padding(
              padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16, //H2
                    bottom: 0,
                  ),
              child: Image.asset(
                widget.imagePath1!,
                width: 500, 
                height: 100, //H3
                fit: BoxFit.cover, 
              ),
            ),
          if (widget.textController1.text.isNotEmpty)
            //Expanded(
              //child: 
              Center(
                child: Padding(
                  padding: widget.imagePath1 != null
                  ? const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 0,
                    bottom: 0,
                  )
                  : const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: 0,
                  ),
                  
                  
                  child: Container(
                    height: widget.textController2.text.isEmpty
                    ? (screenHeight-424)
                    : 150,
                    width: 500,
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 10,
                      bottom: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: widget.textController2.text.isEmpty || (widget.userStyle == 'V' && widget.imagePath2 != null)
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: SelectableText(
                      widget.textController1.text,
                      style: const TextStyle(
                        color: Color.fromRGBO(32, 44, 89, 1),
                        fontFamily: 'Signika',
                        fontSize: 20,
                      ),
                      onSelectionChanged: (TextSelection selection,
                          SelectionChangedCause? cause) {
                        if (cause == SelectionChangedCause.longPress) {
                          if (selection.baseOffset !=
                              selection.extentOffset) {
                            initialShake = shake;
                            helpButton(context, selection,
                                widget.textController1.text, widget.userStyle, initialShake);
                          }
                        }
                      }, //selection
                    ),
                  ),
                ),
              ),
            //),
          if (widget.userStyle == 'V' && widget.imagePath2 != null) // Display second image if available
            Padding(
              padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 0,
                    bottom: 0,
                  ),
            
              child: Image.asset(
                widget.imagePath2!,
                width: 500, 
                height: 100, //H5
                fit: BoxFit.cover, 
              ),
            ),
            
          if (widget.textController2.text.isNotEmpty)
            //Expanded(
              //child: 
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 0,
                    bottom: 0,
                  ),
                  child: Container(
                    height: widget.userStyle == 'V' && widget.imagePath2 != null
                    ? (screenHeight-524)
                    : (screenHeight-424),
                    //constraints: BoxConstraints(
                    //maxHeight: MediaQuery.of(context).size.height - 100.0,),
                    //height: userStyle == 'V' ? MediaQuery.of(context).size.height * 0.2 : MediaQuery.of(context).size.height * 0.3,
                    width: 500,
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: widget.userStyle == 'V' && widget.imagePath2 != null
                      ? 10 
                      : 0,
                      bottom: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: widget.userStyle == 'V' && widget.imagePath2 != null
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),

                    child: SelectableText(
                      widget.textController2.text,
                      style: const TextStyle(
                        color: Color.fromRGBO(32, 44, 89, 1),
                        fontFamily: 'Signika',
                        fontSize: 20,
                      ),
                      onSelectionChanged: (TextSelection selection,
                          SelectionChangedCause? cause) {
                        if (cause == SelectionChangedCause.longPress) {
                          if (selection.baseOffset !=
                              selection.extentOffset) {
                            initialShake = shake;
                            //checkShake(initialShake, selectedText);
                            helpButton(context, selection,
                                widget.textController2.text, widget.userStyle, initialShake);
                          }
                        }
                      }, //selection
                    ),
                  ),
                ),
              ),
            //),
    
    Expanded(
      child: Container(),
    ),

    Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16), //H6
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: widget.currentIndex > 1
                  ? TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: const Size( 40 , 25), //H7
                        backgroundColor: const Color.fromRGBO(255, 184, 51, 1),
                      ),
                      onPressed: () {
                        goIndex = widget.currentIndex - 1;
                        if (goIndex >= 1) {
                          print('page B$goIndex');
                          Navigator.pushNamed(context, '/B$goIndex', arguments: widget.userStyle,);
                        }
                      },
                      child: const Text(
                        'Previous',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'Signika',
                          color: Color.fromRGBO(32, 44, 89, 1),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            Expanded(
              child: Container(
              height: 25, //H
              child: Text(
                'Page ${widget.currentIndex}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Signika',
                  color: Color.fromRGBO(32, 44, 89, 1),
                  fontSize: 18,
                ),
              ),
              )
            ),
            Expanded(
              child: widget.currentIndex < maxIndex
                  ? TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: Size( 40 , 25),//H
                        backgroundColor: const Color.fromRGBO(255, 184, 51, 1),
                      ),
                      onPressed: () {
                        goIndex = widget.currentIndex + 1;
                        print('go B$goIndex');
                        Navigator.pushNamed(
                          context,
                          '/B$goIndex',
                          arguments: widget.userStyle,);
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'Signika',
                          color: Color.fromRGBO(32, 44, 89, 1),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ], //children
        ),
      ),
    ),

  ], //column children
),
    );
  } } //widget

