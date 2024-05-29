import 'package:flutter/material.dart';

import 'billScreen.dart';
import 'homeScreen.dart';
import 'homeScreen2.dart';

class AppRoutes {

  static Map<String, Widget Function(BuildContext)> routes =
  {
    '/home' : (context) => const HomeScreen(),
    '/bill' : (context) => const BillScreen(),
    '/' : (context) => const Education(),
    // '/bill2' :(context) =>
    // '/product' : (context) => const ,
  };
}