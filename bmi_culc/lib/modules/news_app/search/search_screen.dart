import 'package:bmi_culc/layouts/news_app/cubit/cubit.dart';
import 'package:bmi_culc/layouts/news_app/cubit/state.dart';
import 'package:bmi_culc/shared/components/componants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  var Searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
            builder: (context) => BlocConsumer<NewsCubit, NewsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var list = NewsCubit.get(context).search;
                    return Scaffold(
                        appBar: AppBar(
                          title: Text('Search for anythings'),
                          centerTitle: true,
                        ),
                        body: SingleChildScrollView(
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                controller: Searchcontroller,
                                keyboardType: TextInputType.text,
                                validator: ((value) {
                                  if (value!.isEmpty) {
                                    return 'search must be not empty';
                                  }
                                  return null;
                                }),
                                onChanged: (value) {
                                  NewsCubit.get(context).Getsearch(value);
                                },
                              ),
                            ),
                            articleBuilder(list, context)
                          ]),
                        ));
                  },
                )));
  }
}
