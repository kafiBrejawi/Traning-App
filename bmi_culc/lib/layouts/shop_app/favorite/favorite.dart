import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ShopFave extends StatelessWidget {
  const ShopFave({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'FAVEORITE SCREEN',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
