import 'package:flutter/material.dart';
import '../utils/globalVariabal.dart';
import 'home.dart';

class detailScreen extends StatefulWidget {
  const detailScreen({super.key});

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            onPressed: () {
              setState(() {
                items.clear();
                price.clear();
                total = 0;
              });
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Text(
            '${DataList[selectIndex].data}',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 68,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Customer',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  SizedBox(
                    width: 162,
                    child: Text(
                      '${customer}',
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 25, color: Colors.black45),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 30),
              child: const Divider(
                endIndent: 20,
                indent: 10,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Invoice Iteams',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...List.generate(
              items.length,
              (index) => ListTile(
                title: Text(
                  '${items[index]}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  '${price[index]}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Total',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                '${total.round()}',
                style: const TextStyle(fontSize: 30, color: Colors.black45),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Divider(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.of(context).pushNamed('/pdf');
          },
          child: const Icon(Icons.picture_as_pdf),
        ),
      ),
    );
  }
}
