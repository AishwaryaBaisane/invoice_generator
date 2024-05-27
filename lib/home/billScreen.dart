import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:invoice_janrate/home/homeScreen.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => generate(),
      ),
    );
  }
}

Future<Uint8List> generate() {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        children: [
          pw.Table(
            border: pw.TableBorder.all(color: PdfColors.black),
            children: [
              pw.TableRow(
                // verticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.Center(
                    child: pw.Text('data', style: pw.TextStyle(fontSize: 30)),
                  ),
                ],
              ),
              ...List.generate(
                invoiceList.length,
                (index) => pw.TableRow(
                  children: [
                    // pw.SizedBox(height: 70),
                    pw.Text(
                      '${invoiceList[index].name}',
                      style: pw.TextStyle(fontSize: 30),
                    ),
                    pw.SizedBox(height: 70),
                    pw.Center(
                      child: pw.Text(
                        '${invoiceList[index].Price}',
                        style: pw.TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          pw.SizedBox(
            height: 80,
          ),
          pw.Text(
            'Total is  : $rupee',
            style: pw.TextStyle(fontSize: 30),
          )
          // pw.Text('${rupee}',style: pw.TextStyle(fontSize: 30)),
        ],
      ),
    ),
  );
  return pdf.save();
}
