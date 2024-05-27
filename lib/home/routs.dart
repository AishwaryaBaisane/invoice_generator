import 'package:flutter/material.dart';
import 'package:invoice_janrate/home/billScreen.dart';

import 'homeScreen.dart';

class AppRoutes {

  static Map<String, Widget Function(BuildContext)> routes =
  {
    '/' : (context) => const HomeScreen(),
    '/bill' : (context) => const BillScreen(),
  };
}