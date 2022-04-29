import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  double calculation = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('10112d'),
      appBar: AppBar(
        backgroundColor: HexColor('171b36'),
        elevation: 10,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: !isMale ? HexColor('171846') : Colors.blueGrey,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                'assets/images/femaleSymbol.png',
                              ),
                              color: !isMale ? Colors.white : Colors.cyanAccent,
                              width: 100,
                              height: 110,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: isMale ? HexColor('171846') : Colors.blueGrey,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                'assets/images/maleSymbol.png',
                              ),
                              color: isMale ? Colors.white : Colors.cyanAccent,
                              width: 100,
                              height: 110,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  width: 350,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: HexColor('181935'),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Your Height in Cm',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 300,
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          controller: heightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Enter Your Height',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15,),
                                borderSide: BorderSide(
                                    color: Colors.white
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  width: 350,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: HexColor('181935'),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Your Weight in Kg',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 300,
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Enter Your Weight',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15,),
                                borderSide: BorderSide(
                                    color: Colors.white
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Your BMI',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '${calculation.toStringAsFixed(1)}',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 330,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: HexColor('313880'),
              ),
              child: TextButton(
                  onPressed: () {
                    double weight = double.parse(weightController.text),
                        height = double.parse(heightController.text);
                    setState(() {
                      calculation = weight / pow(height / 100, 2);
                    });
                    if (calculation>= 18.5 && calculation <=24.9)
                    {
                      Fluttertoast.showToast(msg: 'Normal Weight');
                    }
                    else if (calculation>= 25 && calculation <=29.9)
                    {
                      Fluttertoast.showToast(msg: 'OverWeight');
                    }
                    else if (calculation>= 30 && calculation <=34.9)
                    {
                      Fluttertoast.showToast(msg: 'Obese');
                    }
                    else if (calculation>= 35 && calculation <=39.9)
                    {
                      Fluttertoast.showToast(msg: 'Severely Obese');
                    }
                    else
                    {
                      Fluttertoast.showToast(msg: 'Morbid Obese',);
                    }
                  },
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
