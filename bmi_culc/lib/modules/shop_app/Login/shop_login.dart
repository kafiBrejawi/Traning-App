import 'package:bmi_culc/layouts/shop_app/shop_layout.dart';
import 'package:bmi_culc/modules/shop_app/Login/cubitlogin.dart';
import 'package:bmi_culc/networks/local/cache_helper.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:bmi_culc/modules/shop_app/Login/states.dart';
import 'package:bmi_culc/modules/shop_app/register/shop_app_rigester.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
//import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/components/componants.dart';
import '../../../shared/components/contstants.dart';

class shoplogin2 extends StatefulWidget {
  @override
  State<shoplogin2> createState() => _shoploginState();
}

class _shoploginState extends State<shoplogin2> {
  var formkey = GlobalKey<FormState>();

  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {
          if (state is ShopLoginSucsessState) {
            if (state.loginmodel.status!) {
              print(state.loginmodel.data!.token);
              CacheHelper.savedata(
                      key: 'token', value: state.loginmodel.data!.token)
                  .then((value) {
                token = state.loginmodel.data!.token!;

                navigateandfinish(context, shoplayout());
              });
            } else {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                headerAnimationLoop: false,
                animType: AnimType.bottomSlide,
                title: '  WARNING   ',
                desc: 'تأكد من ادخالك لبياناتك بشكل صحيح.',
                buttonsTextStyle: const TextStyle(color: Colors.black),
                showCloseIcon: true,
              ).show();
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LOGIN",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "login now to browse our hot offers",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        //TextFormField(controller: ,keyboardType:TextInputType.emailAddress ,validator: ,)
                        TextFormField(
                          controller: emailcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'email address not be empty';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: ((value) {
                            print(value);
                          }),
                          decoration: InputDecoration(
                            labelText: 'email address',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: _obscureText,
                          controller: passwordcontroller,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password not be empty';
                            }
                          },
                          onFieldSubmitted: ((value) {
                            print(value);
                          }),
                          decoration: InputDecoration(
                              labelText: 'password',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                            condition: state is! ShopLoginLoadingState,
                            builder: (context) => defultbutton(
                                  width: double.infinity,
                                  backgroundcolors: Colors.blue,
                                  function: () {
                                    if (formkey.currentState!.validate()) {
                                      ShopLoginCubit.get(context).userlogin(
                                          email: emailcontroller.text,
                                          password: passwordcontroller.text);
                                    }
                                  },
                                ),
                            fallback: (context) {
                              return Center(child: CircularProgressIndicator());
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don/'t have an account?"),
                            TextButton(
                                onPressed: () {
                                  NavigateTo(context, shopregist());
                                },
                                child: Text("rigester now".toUpperCase())),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
