import 'package:flutter/material.dart';

class Menu2 extends StatefulWidget {
  //DEFINE ARGUMENT
  final String lockedOption;  
  const Menu2({Key? key, required this.lockedOption}) : super(key: key);


  @override
  State<Menu2> createState() => _Menu2State();
}

class _Menu2State extends State<Menu2> {
  int _modeNumber = 2;
  //DECLARE VARIABLE FOR PARAMETER
  String receivedMode = ''; 

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    receiveMode();
  }

  void receiveMode() {
    //DEFINE PARAMETER, CALL ARGUMENT
    final String? lockedMode = widget.lockedOption; 
    //print('receiving: $lockedMode');
    if (lockedMode != null) {
      setState(() {
        //INITIALIZE VARIABLE TO PARAMETER
        receivedMode = lockedMode;
        //print('successfully received: $receivedMode');
      });
    }
  }

  late final List<String> _options = [
    'Visual learner',
    'Auditory learner',
    'Reading learner',
    'Kinesthetic learner',
  ];
  late final List<String> _descriptions = [
    'More graphics, for those who likes images, videos, and comics',
    'Text-to-speech feature, for those who likes music, audiobooks, and podcast',
    'Text explanations, for those who likes novels, journaling, and blogs',
    'More interactive elements, for those who likes sports, handcrafts, and lab experiments',
  ];
  late final List<IconData> _icons = [
    Icons.tv_rounded,
    Icons.headset_rounded,
    Icons.library_books_rounded,
    Icons.directions_run_rounded,
  ];
  int _selectedIndex = -1;
  String _selectedOption = '';
  String lockedStyle = '';

  @override
  void initState() {
    super.initState();
    //_controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    //Color buttonColor = Color.fromRGBO(255, 184, 51, 1);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 223, 194, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'User Preference $_modeNumber',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Signika',
            color: Color.fromRGBO(32, 44, 89, 1),
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 184, 51, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const Divider(thickness: 3, color: Color.fromRGBO(142, 154, 175, 1) ),
            const SizedBox(height: 15),
            const Text(
              'Which type of learner are you?',
              style: TextStyle(
                color: Color.fromRGBO(32, 44, 89, 1),
                fontFamily: 'Signika',
                fontSize: 32
              ),
            ),
            const SizedBox(height: 15),
            const Divider(thickness: 3, color: Color.fromRGBO(142, 154, 175, 1) ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: _options.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = index;
                          _selectedOption = _options[index];
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          _selectedIndex == index
                              ? Color.fromRGBO(255, 205, 0, 1)
                              : Color.fromRGBO(255, 184, 51, 1),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: _selectedIndex == index
                                  ? Color.fromRGBO(142, 154, 175, 1)
                                  : Color.fromRGBO(32, 44, 89, 1),
                              width: _selectedIndex == index ? 3.0 : 1.0,
                            ),
                          ),
                        ),
                      ),
                      icon: Icon(_icons[index],
                      size: _selectedIndex == index
                        ? 30
                        : 20,
                      color: _selectedIndex == index
                        ? const Color.fromRGBO(142, 154, 175, 1) 
                        : const Color.fromRGBO(32, 44, 89, 1),
                      ),
                      label: Text(
                        _options[index],
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Signika',
                          fontWeight: _selectedIndex == index
                              ? FontWeight.w800
                              : FontWeight.w400,
                          color: _selectedIndex == index
                              ? Color.fromRGBO(142, 154, 175, 1)
                              : Color.fromRGBO(32, 44, 89, 1),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            
            Visibility(
              visible: _selectedOption.isNotEmpty,
              child: Text(
                'Selected: $_selectedOption',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Text(
              _getDescription(),
              style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: 
                  _selectedOption.isNotEmpty 
                  ? Color.fromRGBO(255, 205, 0, 1)
                  : Color.fromRGBO(255, 184, 51, 1),
                  ),
                onPressed: () {
                  setState(() {
                    lockedStyle = _selectedOption;

                    if (lockedStyle == 'Visual learner') {
                      lockedStyle = 'V';
                    } else if (lockedStyle == 'Auditory learner') {
                      lockedStyle = 'A';
                    } else if (lockedStyle == 'Reading learner') {
                      lockedStyle = 'R';
                    } else if (lockedStyle == 'Kinesthetic learner') {
                      lockedStyle = 'K';
                    }

                    print('Locked Mode: $receivedMode');
                    print('Locked Style: $lockedStyle');
                     switch (receivedMode) {
                      case 'Simplified mode':
                        Navigator.pushNamed(
                          context,
                          '/A1',
                          arguments: lockedStyle,
                        );
                        break;
                      case 'Regular mode':
                        Navigator.pushNamed(
                          context,
                          '/B1',
                          arguments: lockedStyle,
                        );
                        break;
                      case 'In-depth mode':
                        Navigator.pushNamed(
                          context,
                          '/C1',
                          arguments: lockedStyle,
                        );
                        break;
                      default:
                        Navigator.pushNamed(
                          context,
                          '/Menu2',
                          arguments: lockedStyle,
                        );
                        break;
                    }
                  });
                },
                child: Text(
                  'Start Learning',
                  style: TextStyle(
                  fontWeight: _selectedOption.isNotEmpty
                  ? FontWeight.w800
                  : FontWeight.w400,
                  fontSize: _selectedOption.isNotEmpty
                  ? 20
                  : 18,
                  fontFamily: 'Signika',
                  color: _selectedOption.isNotEmpty
                  ? Color.fromRGBO(142, 154, 175, 1)
                  : Color.fromRGBO(32, 44, 89, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDescription() {
    switch (_selectedOption) {
      case 'Visual learner':
        return _descriptions[0];
      case 'Auditory learner':
        return _descriptions[1];
      case 'Reading learner':
        return _descriptions[2];
      case 'Kinesthetic learner':
        return _descriptions[3];
      default:
        return '';
    }
  }
}
