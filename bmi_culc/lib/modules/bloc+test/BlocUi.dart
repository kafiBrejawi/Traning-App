import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BlocUi extends StatefulWidget {
  const BlocUi({super.key});

  @override
  State<BlocUi> createState() => _BlocUiState();
}

class _BlocUiState extends State<BlocUi> {
  int counter = 20;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: Text("bloc ui"),
                  ),
                  body: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              counter++;
                            });
                          },
                          child: Icon(Icons.add),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '$counter',
                          style: TextStyle(fontSize: 20),
                        ),
                        FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                counter--;
                              });
                            },
                            child: Icon(Icons.add))
                      ],
                    ),
                  ),
                )));
  }
}
