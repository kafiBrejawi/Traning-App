import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Center(
            child: Text(
          'search',
          style: Theme.of(context).textTheme.bodyText1,
        )));
  }
}
