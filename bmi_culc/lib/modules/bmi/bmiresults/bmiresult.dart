import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class bmiresult extends StatelessWidget {
  const bmiresult({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text("BMI RESULT"),
            ),
            body: Center(
              child: Container(
                height: 250,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "result= 50",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text("AGE=15",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Text('HEIGHT=150',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
