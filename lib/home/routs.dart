import 'package:flutter/material.dart';
import 'package:invoice_janrate/Invoice_Ganrator/home.dart';

import '../Invoice_Ganrator/detail.dart';
import '../Invoice_Ganrator/pdf.dart';
import 'billScreen.dart';
import 'final.dart';
import 'homeScreen.dart';
import 'lastTry.dart';

class AppRoutes {

  static Map<String, Widget Function(BuildContext)> routes =
  {
    '/home' : (context) => const HomeScreen(),
    '/bill' : (context) => const BillScreen(),
    '/' : (context) => const InvoiceGenerator(),
    '/detail' : (context) => const detailScreen(),
    '/skill' : (context) => const SkillPage(),
    '/final' : (context) => const FinalPage(),
    '/pdf' : (context) => const PdfScreen (),

  };
}