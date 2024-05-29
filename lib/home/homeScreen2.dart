import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

TextEditingController txtPrice = TextEditingController();
TextEditingController txtPrice1 = TextEditingController();
TextEditingController txtQty = TextEditingController();
TextEditingController txtProName = TextEditingController();

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xfff1f1f1),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Education',
            style: TextStyle(color: Colors.white),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          actions: [
            Icon(
              Icons.settings,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  buildTextField('Product Name', txtProName),
                  SizedBox(height: 20,),
                  buildTextField('Quantity', txtQty),
                  SizedBox(height: 20,),
                  buildTextField('price', txtPrice),
                  SizedBox(height: 20,),
                  buildTextField('Product Name', txtProName),
                  SizedBox(height: 20,),
                  buildTextField('Quantity', txtQty),
                  SizedBox(height: 20,),
                  buildTextField('price', txtPrice1),


                  SizedBox(height: 50,),
                  Text('Total is : $total',style: TextStyle(fontSize: 30),),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            setState(() {
              price = double.parse(txtPrice.text);
              price1 = double.parse(txtPrice1.text);

               total = price + price1;
            });
          },
          child: Container(
            height: 45,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  'ADD',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField buildTextField(String label, TextEditingController controller) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: label,
      ),
    );
  }
}

double Course = 0;

List Product_Price = [];

List abc = [];

double price = 0;
double price1 = 0;
double total =0;// int index =0;
