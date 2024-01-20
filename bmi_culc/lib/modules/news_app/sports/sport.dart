import 'package:bmi_culc/layouts/news_app/cubit/cubit.dart';
import 'package:bmi_culc/layouts/news_app/cubit/state.dart';
import 'package:bmi_culc/shared/components/componants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sport extends StatelessWidget {
  const Sport({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        debugShowCheckedModeBanner: false,
        home: Builder(
            builder: (context) => BlocConsumer<NewsCubit, NewsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var list = NewsCubit.get(context).sports;
                  return ConditionalBuilder(
                      builder: (context) => ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) =>
                                buildArticalItem(list[index], context),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    Divider(thickness: 20),
                          ),
                      condition: list.length > 0,
                      fallback: (context) =>
                          (Center(child: CircularProgressIndicator())));
                })));
  }
}
