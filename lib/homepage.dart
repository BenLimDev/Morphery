import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen>with SingleTickerProviderStateMixin {
  late AnimationController aniController;
  late Animation<double> _animation;
  String displayText = 'Morphery';
  String motto = 'Morph-learning till Mastery';
  final PageController pgController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    aniController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200), 
    );

    _animation = Tween<double>(begin: 60.0, end: 40.0).animate(aniController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 184, 51, 1),
       appBar: null,
      body: Stack(
        children: [
        Column(
          children: <Widget>[
            Expanded(
            child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
            width: 400,
            height: MediaQuery.of(context).size.height*0.2,
            child: GestureDetector(
              onTap: () async{
                print('pressed Morph');
                setState(() {
                  if (displayText == 'Morphery') {
                    displayText = motto;
                    aniController.forward();
                  } else {
                    displayText = 'Morphery';
                    aniController.reverse();
                  }
                });
                AssetsAudioPlayer.newPlayer().open(
                Audio("assets/1.mp3"),
                autoStart: true,
                showNotification: true,
                );
              },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: Text(
              displayText,
              textAlign: TextAlign.center,
              key: UniqueKey(), 
              style: TextStyle(
                fontSize: displayText=='Morphery'? 60:40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Signika',
                color: const Color.fromRGBO(32, 44, 89, 1),
              ),
            ),
          ),
          ),
            ),
            ),
        ),
            const SizedBox(height: 20,),
            Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32), 
            child: 
            Align(
            alignment: Alignment.bottomCenter,
            child: Row (children:[
            Expanded(child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: 
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
              fixedSize: const Size( 150 , 70), 
              backgroundColor: const Color.fromRGBO(32, 44, 89, 1),
              ).copyWith(
                elevation: MaterialStateProperty.all(20),
                overlayColor: MaterialStateProperty.all(Colors.transparent), 
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context, 
                  '/Menu1'
                );
              },
              child: const Text(
                'Begin',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                  fontFamily: 'Signika',
                  color: Color.fromRGBO(255, 184, 51, 1),
                ),
              ),
            ),
            )
            ]
            )
            )
            )
          ],
        ),

        Positioned.fill(
          right: 32,
          left: 32,
          bottom: MediaQuery.of(context).size.height * 0.4,
          top: MediaQuery.of(context).size.height * 0.1,
          child: PageView(
            controller: pgController,
            onPageChanged: (int index) {
                _currentPageNotifier.value = index;
            },
            children: const [
              OnboardingPage(
                  image: 'img/onboard.jpg',
                  title: 'Select your learning mode',
                  description: 'Everyone\'s different!',
              ),
              OnboardingPage(
                  image: 'img/onboard2.jpg',
                  title: 'Select your learning style',
                  description: 'How do you prefer to learn?',
              ),
              OnboardingPage(
                  image: 'img/onboard3.png',
                  title: 'Long press for features!',
                  description: 'Personalized learning!',
              ),
            ],
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CirclePageIndicator(
                dotColor: const Color.fromRGBO(142, 154, 175, 1),
                selectedDotColor: const Color.fromRGBO(32, 44, 89, 1),
                itemCount: 3, // Number of pages
                currentPageNotifier: _currentPageNotifier,
              ),
            ),
          ),

        ]
      )
    );
  }
  @override
  void dispose() {
    aniController.dispose();
    super.dispose();
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image), // Replace this with your image or widget
        const SizedBox(width: 5, height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: const Color.fromRGBO(32, 44, 89, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(32, 44, 89, 1),
          ),
        ),
      ],
    );
  }
}