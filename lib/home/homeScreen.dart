import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            ...List.generate(
              invoiceList.length,
              (index) => ListTile(
                trailing: Text(
                  '\$${invoiceList[index].Price}',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                subtitle: Text(
                  invoiceList[index].name,
                  style: const TextStyle(color: Colors.black45),
                ),
                title: Text(
                  invoiceList[index].name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              double total = 0;
              for (int i = 0; i < invoiceList.length; i++) {
                total += invoiceList[i].Price;
                rupee = total;
              }
              print(total);
              Navigator.of(context).pushNamed('/bill', arguments: rupee);
            });
          },
          child: Icon(Icons.picture_as_pdf),
        ),
      ),
    );
  }
}

TextEditingController textEditingController = TextEditingController();

class InvoiceModel {
  String? name;
  double? Price;

  InvoiceModel({this.name, this.Price});
}

List invoiceList = [
  InvoiceModel(Price: 23, name: 'Apple'),
  InvoiceModel(Price: 50, name: 'Banana'),
  InvoiceModel(Price: 78, name: 'Grapes'),
  InvoiceModel(Price: 150, name: 'WaterMilan'),
];

double rupee = 0;
