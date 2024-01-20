import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class bmiscreen extends StatefulWidget {
  const bmiscreen({super.key});

  @override
  State<bmiscreen> createState() => _bmiscreenState();
}

class _bmiscreenState extends State<bmiscreen> {
  bool ismale = true;
  double height = 120;
  int weight = 40;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.black,
                    title: Text("BMI CALCULATER"),
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ismale = true;
                                    });
                                  },
                                  child: Container(
                                      width: 90,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.male,
                                            size: 70,
                                          ),
                                          Text(
                                            "MALE",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: ismale
                                            ? Colors.blue
                                            : Colors.grey[400],
                                      )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ismale = false;
                                    });
                                  },
                                  child: Container(
                                      width: 90,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.female,
                                            size: 70,
                                          ),
                                          Text(
                                            "FEMALE",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: !ismale
                                            ? Colors.blue
                                            : Colors.grey[400],
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[400]),
                          child: Expanded(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text("HEIGHT",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text('${height.round()}',
                                        style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("cm",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Slider(
                                    value: height,
                                    max: 220,
                                    min: 80,
                                    onChanged: (value) {
                                      setState(() {
                                        height = value;
                                      });
                                      print(value.round());
                                    })
                              ])),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[400]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("AGE",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold)),
                                      Text('${age}',
                                          style: TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FloatingActionButton(
                                            onPressed: () {
                                              setState(() {
                                                age--;
                                              });
                                            },
                                            mini: true,
                                            child: Icon(Icons.remove),
                                          ),
                                          FloatingActionButton(
                                            onPressed: () {
                                              setState(() {
                                                age++;
                                              });
                                            },
                                            mini: true,
                                            child: Icon(Icons.add),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[400]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("WIEGHT",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold)),
                                      Text('${weight}',
                                          style: TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FloatingActionButton(
                                            onPressed: () {
                                              setState(() {
                                                weight--;
                                              });
                                            },
                                            mini: true,
                                            child: Icon(Icons.remove),
                                          ),
                                          FloatingActionButton(
                                            onPressed: () {
                                              setState(() {
                                                weight++;
                                              });
                                            },
                                            mini: true,
                                            child: Icon(Icons.add),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.blueAccent,
                        child: MaterialButton(
                          height: 50,
                          onPressed: () {
                            var result = weight / pow(height / 100, 2);
                            print(result.round());

                            Navigator.of(context).pushNamed('result');
                          },
                          child: Text(
                            "Calculater",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                )));
  }
}
// var result = weight / pow(height/100,2);
//print(result.round());