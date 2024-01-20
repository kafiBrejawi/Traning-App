import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/Social_app/social-app-cubit.dart';
import '../../../layouts/Social_app/social-app-states.dart';
import '../../../layouts/news_app/cubit/cubit.dart';
import '../../../shared/components/componants.dart';

class users extends StatelessWidget {
  const users({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Center(
            child: Text(
          'user',
          style: Theme.of(context).textTheme.bodyText1,
        )));
  }
}
