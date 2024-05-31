import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});

  @override
  State<SkillPage> createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'D mart',
          style: TextStyle(color: Colors.white, fontSize: 25),
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
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/final');
            },
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            ...List.generate(
              textControllerList.length,
              (index) => Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                height: height * 0.2 - 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Container(
                      height: height * 0.1 - 50,
                      width: width * 400,
                      decoration: BoxDecoration(
                        color: Color(0xff8596a0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              ' Price ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  s--;
                                  textControllerList.removeAt(index);
                                });
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // SizedBox(width: 5,)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: height * 0.1 - 22,
                      width: 370,
                      child: TextFormField(
                        controller: textControllerList[index],
                        decoration: InputDecoration(
                          hintText: 'Price',
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            ...List.generate(
              ControllerList.length,
                  (index) => Container(
                // padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(15),
                  height: height * 0.3 -50 ,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          height: height * 0.1 - 50,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                            color: Color(0xff8596a0),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '  Product',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    ControllerList.removeAt(index - 1);
                                  });
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildTextFormField(
                          'Qty', ControllerList[index].txtQty!),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildTextFormField(
                          'ProName', ControllerList[index].txtProName!),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 400,
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            TextEditingController textController = TextEditingController();
            textControllerList.add(textController);

            ControllerList.add(ControllerModel(
                txtProName: txtProName,
                txtQty: txtQty));
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
    );
  }
}

Widget buildTextFormField(String label, TextEditingController controller) {
  return SizedBox(
    width: 340,
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
      ),
    ),
  );
}

int s = 0;
double Skills = 0;
TextEditingController textController = TextEditingController();
List<TextEditingController> textControllerList = [textController];




class ControllerModel {
  TextEditingController? txtQty;
  TextEditingController? txtProName;


  ControllerModel(
      {this.txtProName, this.txtQty, });
}

List<ControllerModel> ControllerList = [
  ControllerModel(
      txtQty: txtQty,
      txtProName: txtProName,
     )
];



TextEditingController txtQty = TextEditingController();
TextEditingController txtProName = TextEditingController();