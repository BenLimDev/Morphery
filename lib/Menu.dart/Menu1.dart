import 'package:flutter/material.dart';

class Menu1 extends StatefulWidget {
  const Menu1({Key? key}) : super(key: key);

  @override
  State<Menu1> createState() => _ModeWidgetState();
}

class _ModeWidgetState extends State<Menu1> {
  //late PageController _controller;
  final int _modeNumber = 1;
  String lockedMode = ''; //for passing to Menu2

  late List<String> _options = [
    'Simplified mode',
    'Regular mode',
    'In-depth mode',
  ];
  late List<String> _descriptions = [
    'Minimal explanations, best for those who want a quick read',
    'Essential information, best for those who want the important bits',
    'Rich elaborations, best for those who are curious-minded',
  ];
  late List<IconData> _icons = [
    Icons.abc_outlined, // Example icon for 'Simplified mode'
    Icons.check, // Example icon for 'Regular mode'
    Icons.search_rounded, // Example icon for 'In-depth mode'
  ];
  int _selectedIndex = -1;
  String _selectedOption = '';
  String lockedOption = '';

  @override
  void initState() {
    super.initState();
    //_controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 223, 194, 1),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'User Preference $_modeNumber',
          style: const TextStyle(
            fontSize: 25,
            fontFamily: 'Signika',
            color: Color.fromRGBO(32, 44, 89, 1),
          ),
        ),
        backgroundColor: const Color.fromRGBO(255, 184, 51, 1),
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
              'Which study mode would you like?',
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
                              ? Color.fromRGBO(255, 205, 0, 1) // Change to the desired color for selected button
                              : Color.fromRGBO(255, 184, 51, 1), // Change to the default color for unselected buttons
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                            side: BorderSide(
                              color: _selectedIndex == index
                              ? const Color.fromRGBO(142, 154, 175, 1) 
                              : const Color.fromRGBO(32, 44, 89, 1),
                              width: _selectedIndex == index
                              ? 3.0
                              : 1.0,
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
                              ? const Color.fromRGBO(142, 154, 175, 1) 
                              : const Color.fromRGBO(32, 44, 89, 1),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 14),
            Visibility(
              visible: _selectedOption.isNotEmpty,
              child: Text(
                'Selected: $_selectedOption',
                style: const TextStyle(
                  color: Color.fromRGBO(32, 44, 89, 1),
                    fontFamily: 'Signika',
                    fontSize: 20
                ),
              ),
            ),
            Text(
              _getDescription(),
              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400, color: Colors.grey),
            ),
            const SizedBox(height: 18),
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
                    lockedOption = _selectedOption;
                    if (lockedOption == '') {
                      print('No locked mode');
                      Navigator.pushNamed(
                        context, 
                        '/Menu1', 
                        arguments: lockedOption,
                    );}
                    else{
                      print('Locked Mode: $lockedOption');
                      Navigator.pushNamed(
                        context, 
                        '/Menu2', 
                        arguments: lockedOption,
                      );
                    }
                  });
                },
                child: Text(
                  'Continue',
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
      case 'Simplified mode':
        return _descriptions[0];
      case 'Regular mode':
        return _descriptions[1];
      case 'In-depth mode':
        return _descriptions[2];
      default:
        return '';
    }
  }
}
