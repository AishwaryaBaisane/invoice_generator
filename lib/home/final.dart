import 'package:flutter/material.dart';

import 'lastTry.dart';
import 'lastTry.dart';

// import 'homeScreen2.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                setState(() {
                  total = 0;
                  qtotal = 0;
                  finalPrice =0;
                  double price = 0;
                  double qty =0;
                  for (int i = 0; i < textControllerList.length; i++) {
                    price = double.parse(textControllerList[i].text);
                    // qty = double.parse(textControllerList1[i].text);
                    total = total! + price;
                  }

                  // }
                  for (int i = 0; i <  textControllerList1.length; i++) {
                    // price = double.parse(textControllerList[i].text);
                    qty = double.parse(textControllerList1[i].text);
                    qtotal = qtotal! + qty;

                  }
                  finalPrice = qtotal! * total!;

                });
                print(total);
                print(qtotal);
              },
              child: Icon(
                Icons.arrow_right_alt_rounded,
                color: Colors.black,
                size: 40,
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              ...List.generate(
                ControllerList.length,
                (index) => Column(
                  children: [
                    ListTile(
                      subtitle: Text('${txtProName.text}'),
                    ),
                  ],
                ),
              ),
              ...List.generate(
                textControllerList.length,
                    (index) => Column(
                  children: [
                    ListTile(
                      title: Text('${textController.text}'),
                    ),
                  ],
                ),
              ),
              ...List.generate(
                textControllerList1.length,
                    (index) => Column(
                  children: [
                    ListTile(
                      title: Text('${textController1.text}'),
                    ),
                  ],
                ),
              ),
              Text(
                'Total is : ${finalPrice}',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double? total;
double? qtotal;
double? finalPrice ;
