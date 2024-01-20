import 'package:bmi_culc/layouts/home_app/home_layout.dart';
import 'package:bmi_culc/layouts/news_app/news-layout.dart';
import 'package:bmi_culc/layouts/shop_app/cubit/cubit.dart';
import 'package:bmi_culc/layouts/shop_app/cubit/states.dart';
import 'package:bmi_culc/layouts/shop_app/onboarding_screen.dart';
import 'package:bmi_culc/layouts/shop_app/shop_layout.dart';

import 'package:bmi_culc/modules/home_app/done_tasks/new_tasks/test.dart';
import 'package:bmi_culc/modules/shop_app/Login/shop_login.dart';
import 'package:bmi_culc/modules/social-app/home/HomeScreen.dart';

import 'package:bmi_culc/networks/local/cache_helper.dart';

import 'package:bmi_culc/networks/local/remote/dio_helper.dart';
import 'package:bmi_culc/shared/components/contstants.dart';
import 'package:bmi_culc/shared/cubit.dart';
import 'package:bmi_culc/shared/state.dart';
import 'package:bmi_culc/styles/bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layouts/Social_app/SocialLayouts.dart';
import 'layouts/news_app/cubit/cubit.dart';
import 'layouts/news_app/cubit/state.dart';
import 'modules/bloc+test/BlocUi.dart';
import 'modules/bloc+test/bloc.dart';
import 'modules/shop_app/board/onboard2.dart';
import 'modules/social-app/social-login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  Widget widget;
  bool onboard = CacheHelper.getData(key: 'onboard2');
  token = CacheHelper.getData(key: 'token');
  uid = CacheHelper.getData(key: 'uid');

  //if (onboard != null) {
  //  if (token != null)
  //   widget = shoplayout();
  // else
  //   widget = shoplogin2();
  // } else
  //  widget = onboard2();
  //print(onboard);

  if (uid != null) {
    widget = SocialLayout();
  } else {
    widget = LoginSocial();
  }
  runApp(MyApp(
    startwidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startwidget;
  const MyApp({super.key, required this.startwidget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              titleSpacing: 20,
             
              systemOverlayStyle: SystemUiOverlayStyle.light,
              backgroundColor: Colors.white,
              elevation: 0.0,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(
                color: Colors.black,
              )),
          textTheme: TextTheme()),
      home: startwidget,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
