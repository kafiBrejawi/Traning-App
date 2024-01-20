import 'package:bmi_culc/layouts/shop_app/cubit/cubit.dart';
import 'package:bmi_culc/layouts/shop_app/search/shop_search.dart';
import 'package:bmi_culc/modules/shop_app/Login/shop_login.dart';
import 'package:bmi_culc/networks/local/cache_helper.dart';
import 'package:bmi_culc/shared/components/componants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/states.dart';

class shoplayout extends StatelessWidget {
  const shoplayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
            builder: (context) => BlocProvider(
                create: (BuildContext context) => ShopCubit()
                  ..getHomeDate()
                  ..getCategoreisDate()
                  ..GetUserData(),
                child: BlocConsumer<ShopCubit, ShopState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      var cubit = ShopCubit.get(context);
                      return Scaffold(
                        appBar: AppBar(
                          title: Text("WearNsta "),
                          centerTitle: true,
                          systemOverlayStyle: SystemUiOverlayStyle.light,
                          backgroundColor: Colors.white,
                          elevation: 1.0,
                          titleTextStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                          actions: [
                            IconButton(
                              onPressed: () {
                                NavigateTo(context, ShopSearch());
                              },
                              icon: Icon(Icons.search),
                              color: Colors.black,
                            ),
                          ],
                        ),
                        body: cubit.bottomscreen[cubit.currentindex],
                        bottomNavigationBar: BottomNavigationBar(
                            unselectedItemColor: Colors.grey,
                            selectedItemColor: Colors.orange,
                            backgroundColor: Colors.grey,
                            showUnselectedLabels: true,
                            showSelectedLabels: true,
                            onTap: (index) {
                              cubit.changeBottom(index);
                            },
                            currentIndex: cubit.currentindex,
                            items: [
                              BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.home,
                                ),
                                backgroundColor: Colors.white,
                                label: 'home',
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.category,
                                ),
                                label: 'category',
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.favorite,
                                ),
                                label: 'favorites',
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.settings,
                                ),
                                label: 'settings',
                              )
                            ]),
                      );
                    }))));
  }
}
