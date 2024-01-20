import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ShopSearch extends StatelessWidget {
  const ShopSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.white,
        elevation: 1.0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Center(child: Text("search now")),
    );
  }
}
