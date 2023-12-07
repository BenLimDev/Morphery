import 'package:Morphery/Pages.dart/A.dart/A1.dart';
import 'package:Morphery/Pages.dart/A.dart/A2.dart';
import 'package:Morphery/Pages.dart/A.dart/A3.dart';
import 'package:Morphery/Pages.dart/A.dart/A4.dart';
import 'package:Morphery/Pages.dart/A.dart/A5.dart';
import 'package:Morphery/Pages.dart/A.dart/A6.dart';
import 'package:Morphery/Pages.dart/A.dart/A7.dart';
import 'package:Morphery/Pages.dart/A.dart/A8.dart';
import 'package:Morphery/Pages.dart/A.dart/A9.dart';
import 'package:Morphery/Pages.dart/A.dart/A10.dart';
import 'package:Morphery/Pages.dart/A.dart/A14.dart';
import 'package:Morphery/Pages.dart/A.dart/A11.dart';
import 'package:Morphery/Pages.dart/A.dart/A12.dart';
import 'package:Morphery/Pages.dart/A.dart/A13.dart';
import 'package:Morphery/Pages.dart/A.dart/A15.dart';
import 'package:Morphery/Pages.dart/B.dart/B1.dart';
import 'package:Morphery/Pages.dart/B.dart/B2.dart';
import 'package:Morphery/Pages.dart/B.dart/B3.dart';
import 'package:Morphery/Pages.dart/B.dart/B4.dart';
import 'package:Morphery/Pages.dart/B.dart/B5.dart';
import 'package:Morphery/Pages.dart/B.dart/B6.dart';
import 'package:Morphery/Pages.dart/B.dart/B7.dart';
import 'package:Morphery/Pages.dart/B.dart/B8.dart';
import 'package:Morphery/Pages.dart/B.dart/B9.dart';
import 'package:Morphery/Pages.dart/B.dart/B10.dart';
import 'package:Morphery/Pages.dart/B.dart/B11.dart';
import 'package:Morphery/Pages.dart/B.dart/B12.dart';
import 'package:Morphery/Pages.dart/B.dart/B13.dart';
import 'package:Morphery/Pages.dart/B.dart/B14.dart';
import 'package:Morphery/Pages.dart/B.dart/B15.dart';
import 'package:Morphery/Pages.dart/B.dart/B16.dart';
import 'package:Morphery/Pages.dart/B.dart/B17.dart';
import 'package:Morphery/Pages.dart/B.dart/B18.dart';
import 'package:Morphery/Pages.dart/B.dart/B19.dart';
import 'package:Morphery/Pages.dart/B.dart/B20.dart';
import 'package:Morphery/Pages.dart/B.dart/B21.dart';
import 'package:Morphery/Pages.dart/C.dart/C1.dart';
import 'package:Morphery/Pages.dart/C.dart/C2.dart';
import 'package:Morphery/Pages.dart/C.dart/C3.dart';
import 'package:Morphery/Pages.dart/C.dart/C4.dart';
import 'package:Morphery/Pages.dart/C.dart/C5.dart';
import 'package:Morphery/Pages.dart/C.dart/C6.dart';
import 'package:Morphery/Pages.dart/C.dart/C7.dart';
import 'package:Morphery/Pages.dart/C.dart/C8.dart';
import 'package:Morphery/Pages.dart/C.dart/C9.dart';
import 'package:Morphery/Pages.dart/C.dart/C10.dart';
import 'package:Morphery/Pages.dart/C.dart/C11.dart';
import 'package:Morphery/Pages.dart/C.dart/C12.dart';
import 'package:Morphery/Pages.dart/C.dart/C13.dart';
import 'package:Morphery/Pages.dart/C.dart/C14.dart';
import 'package:Morphery/Pages.dart/C.dart/C15.dart';
import 'package:Morphery/Pages.dart/C.dart/C16.dart';
import 'package:Morphery/Pages.dart/C.dart/C17.dart';
import 'package:Morphery/Pages.dart/C.dart/C18.dart';
import 'package:Morphery/Pages.dart/C.dart/C19.dart';
import 'package:Morphery/Pages.dart/C.dart/C20.dart';
import 'package:Morphery/Pages.dart/C.dart/C21.dart';
import 'package:Morphery/Pages.dart/C.dart/C22.dart';
import 'package:Morphery/Pages.dart/C.dart/C23.dart';
import 'package:Morphery/Pages.dart/C.dart/C24.dart';
import 'package:Morphery/Pages.dart/C.dart/C25.dart';
import 'package:Morphery/Pages.dart/C.dart/C26.dart';
import 'package:Morphery/Pages.dart/C.dart/C27.dart';
import 'package:Morphery/Pages.dart/C.dart/C28.dart';
import 'package:Morphery/Pages.dart/C.dart/C29.dart';
import 'package:Morphery/Menu.dart/Menu1.dart';
import 'package:Morphery/Menu.dart/Menu2.dart';
import 'package:flutter/material.dart';

Route<dynamic> getPageRoute(RouteSettings settings) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      // Your pages can be conditionally returned here based on settings.name
      switch (settings.name) {
        case '/Menu1':
          return const Menu1(); // No arguments needed here
        case '/Menu2':
          return Menu2(lockedOption: settings.arguments as String,);
        case '/A1':
          return A1(lockedStyle: settings.arguments as String,);
        case '/A2':
           return A2(lockedStyle: settings.arguments as String,);
        case '/A3':
           return A3(lockedStyle: settings.arguments as String,);        
        case '/A4':
           return A4(lockedStyle: settings.arguments as String,);   
        case '/A5':
           return A5(lockedStyle: settings.arguments as String,);   
        case '/A6':
           return A6(lockedStyle: settings.arguments as String,);   
        case '/A7':
           return A7(lockedStyle: settings.arguments as String,);   
        case '/A8':
           return A8(lockedStyle: settings.arguments as String,);   
        case '/A9':
           return A9(lockedStyle: settings.arguments as String,);   
        case '/A10':
           return A10(lockedStyle: settings.arguments as String,);
        case '/A11':
           return A11(lockedStyle: settings.arguments as String,);   
        case '/A12':
           return A12(lockedStyle: settings.arguments as String,);   
        case '/A13':
           return A13(lockedStyle: settings.arguments as String,);   
        case '/A14':
           return A14(lockedStyle: settings.arguments as String,);   
        case '/A15':
           return A15(lockedStyle: settings.arguments as String,);  
        case '/B1':
          return B1(lockedStyle: settings.arguments as String,); 
        case '/B2':
          return B2(lockedStyle: settings.arguments as String,); 
        case '/B3':
          return B3(lockedStyle: settings.arguments as String,);
        case '/B4':
          return B4(lockedStyle: settings.arguments as String,); 
        case '/B5':
          return B5(lockedStyle: settings.arguments as String,); 
        case '/B6':
          return B6(lockedStyle: settings.arguments as String,); 
        case '/B7':
          return B7(lockedStyle: settings.arguments as String,); 
        case '/B8':
          return B8(lockedStyle: settings.arguments as String,); 
        case '/B9':
          return B9(lockedStyle: settings.arguments as String,); 
        case '/B10':
          return B10(lockedStyle: settings.arguments as String,);
        case '/B11':
          return B11(lockedStyle: settings.arguments as String,); 
        case '/B12':
          return B12(lockedStyle: settings.arguments as String,); 
        case '/B13':
          return B13(lockedStyle: settings.arguments as String,);
        case '/B14':
          return B14(lockedStyle: settings.arguments as String,); 
        case '/B15':
          return B15(lockedStyle: settings.arguments as String,); 
        case '/B16':
          return B16(lockedStyle: settings.arguments as String,); 
        case '/B17':
          return B17(lockedStyle: settings.arguments as String,); 
        case '/B18':
          return B18(lockedStyle: settings.arguments as String,); 
        case '/B19':
          return B19(lockedStyle: settings.arguments as String,); 
        case '/B20':
          return B20(lockedStyle: settings.arguments as String,);
        case '/B21':
          return B21(lockedStyle: settings.arguments as String,);  
        case '/C1':
           return C1(lockedStyle: settings.arguments as String,); 
        case '/C2':
           return C2(lockedStyle: settings.arguments as String,);
        case '/C3':
           return C3(lockedStyle: settings.arguments as String,);
        case '/C4':
           return C4(lockedStyle: settings.arguments as String,);
        case '/C5':
           return C5(lockedStyle: settings.arguments as String,);
        case '/C6':
           return C6(lockedStyle: settings.arguments as String,);
        case '/C7':
           return C7(lockedStyle: settings.arguments as String,);
        case '/C8':
           return C8(lockedStyle: settings.arguments as String,);
        case '/C9':
           return C9(lockedStyle: settings.arguments as String,);
        case '/C10':
           return C10(lockedStyle: settings.arguments as String,); 
        case '/C11':
           return C11(lockedStyle: settings.arguments as String,); 
        case '/C12':
           return C12(lockedStyle: settings.arguments as String,);
        case '/C13':
           return C13(lockedStyle: settings.arguments as String,);
        case '/C14':
           return C14(lockedStyle: settings.arguments as String,);
        case '/C15':
           return C15(lockedStyle: settings.arguments as String,);
        case '/C16':
           return C16(lockedStyle: settings.arguments as String,);
        case '/C17':
           return C17(lockedStyle: settings.arguments as String,);
        case '/C18':
           return C18(lockedStyle: settings.arguments as String,);
        case '/C19':
           return C19(lockedStyle: settings.arguments as String,);
        case '/C20':
           return C20(lockedStyle: settings.arguments as String,);    
        case '/C21':
           return C21(lockedStyle: settings.arguments as String,); 
        case '/C22':
           return C22(lockedStyle: settings.arguments as String,);
        case '/C23':
           return C23(lockedStyle: settings.arguments as String,);
        case '/C24':
           return C24(lockedStyle: settings.arguments as String,);
        case '/C25':
           return C25(lockedStyle: settings.arguments as String,);
        case '/C26':
           return C26(lockedStyle: settings.arguments as String,);
        case '/C27':
           return C27(lockedStyle: settings.arguments as String,);
        case '/C28':
           return C28(lockedStyle: settings.arguments as String,);
        case '/C29':
           return C29(lockedStyle: settings.arguments as String,);
        default:
          return Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          );
      }
    },
    transitionsBuilder: (_, __, ___, child) => child,
  );
}
