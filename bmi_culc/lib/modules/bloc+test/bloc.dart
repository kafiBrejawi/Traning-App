import 'package:bmi_culc/layouts/home_app/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layouts/home_app/cubit/cubit.dart';

class bloc extends StatelessWidget {
  const bloc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
            builder: (context) => BlocProvider(
                  create: (BuildContext context) => CounterCubit(),
                  child: BlocConsumer<CounterCubit, CounterStates>(
                      listener: (context, state) {
                    if (state is CounterInitialState) print("initial state");
                    if (state is CounterPlusState) print("plus state");
                    if (state is CounterMunState) print("mun state");
                  }, builder: (context, state) {
                    return Scaffold(
                      body: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              CounterCubit.get(context).plus();
                            },
                            child: Icon(Icons.add),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${CounterCubit.get(context).counter}',
                            style: TextStyle(fontSize: 20),
                          ),
                          FloatingActionButton(
                              onPressed: () {
                                CounterCubit.get(context).mun();
                              },
                              child: Icon(Icons.add))
                        ],
                      ),
                    );
                  }),
                )));
  }
}
