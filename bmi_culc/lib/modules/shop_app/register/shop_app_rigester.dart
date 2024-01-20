import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi_culc/modules/shop_app/register/cubitregist.dart';
import 'package:bmi_culc/modules/shop_app/register/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/shop_app/shop_layout.dart';
import '../../../networks/local/cache_helper.dart';
import '../../../shared/components/componants.dart';
import '../../../shared/components/contstants.dart';

class shopregist extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  shopregist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ShopRegistCubit(),
        child: BlocConsumer<ShopRegistCubit, ShopRegistState>(
          listener: (context, state) {
            if (state is ShopRegistSucsessState) {
              if (state.loginmodel.status!) {
                print(state.loginmodel.data!.token);
                CacheHelper.savedata(
                        key: 'token', value: state.loginmodel.data!.token)
                    .then((value) {
                  print("hon");
                  token = state.loginmodel.data!.token!;
                  navigateandfinish(context, shoplayout());
                });
                // Fluttertoast.showToast(
                //  msg: "true",
                // toastLength: Toast.LENGTH_SHORT,
                // gravity: ToastGravity.BOTTOM,
                // timeInSecForIosWeb: 5,
                // backgroundColor: Colors.green,
                // textColor: Colors.white,
                // fontSize: 16.0);
                //  AwesomeDialog(
                //  context: context,
                // dialogType: DialogType.success,
                // headerAnimationLoop: false,
                //animType: AnimType.bottomSlide,
                //title: 'SUCSESS  ',
                //desc: ' تم تسجيل الدخول بنجاح ',
                // buttonsTextStyle: const TextStyle(color: Colors.black),
                // showCloseIcon: true,
                // ).show();
              } else {
                // Fluttertoast.showToast(
                //   msg: "fasle",
                //   toastLength: Toast.LENGTH_SHORT,
                //   gravity: ToastGravity.BOTTOM,
                // timeInSecForIosWeb: 5,
                // backgroundColor: Colors.red,
                // textColor: Colors.white,
                // fontSize: 16.0);
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
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Register now to browse our hot offers",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //TextFormField(controller: ,keyboardType:TextInputType.emailAddress ,validator: ,)
                            TextFormField(
                              controller: namecontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'name address not be empty';
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: ((value) {
                                print(value);
                              }),
                              decoration: InputDecoration(
                                labelText: 'name address',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
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
                              height: 5,
                            ),
                            TextFormField(
                              controller: phonecontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'phone address not be empty';
                                }
                              },
                              keyboardType: TextInputType.phone,
                              onFieldSubmitted: ((value) {
                                print(value);
                              }),
                              decoration: InputDecoration(
                                labelText: 'phone address',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.phone),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
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
                                    onTap: () {},
                                  )),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ConditionalBuilder(
                                condition: state is! ShopRegistLoadingState,
                                builder: (context) => defultbutton(
                                      width: double.infinity,
                                      backgroundcolors: Colors.orange,
                                      function: () {
                                        if (formkey.currentState!.validate()) {
                                          ShopRegistCubit.get(context)
                                              .userRegist(
                                                  email: emailcontroller.text,
                                                  password:
                                                      passwordcontroller.text,
                                                  phone: phonecontroller.text,
                                                  name: namecontroller.text);
                                        }
                                      },
                                    ),
                                fallback: (context) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
