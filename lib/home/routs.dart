import 'package:flutter/material.dart';

import 'billScreen.dart';
import 'final.dart';
import 'homeScreen.dart';
import 'lastTry.dart';

class AppRoutes {

  static Map<String, Widget Function(BuildContext)> routes =
  {
    '/home' : (context) => const HomeScreen(),
    '/bill' : (context) => const BillScreen(),
    // '/edu' : (context) => const Education(),
    '/' : (context) => const SkillPage(),
    '/final' : (context) => const FinalPage(),
  };
}