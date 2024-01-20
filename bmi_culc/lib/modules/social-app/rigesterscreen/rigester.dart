import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi_culc/modules/shop_app/register/cubitregist.dart';
import 'package:bmi_culc/modules/shop_app/register/states.dart';
import 'package:bmi_culc/modules/social-app/home/HomeScreen.dart';
import 'package:bmi_culc/modules/social-app/rigesterscreen/state.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/Social_app/SocialLayouts.dart';
import '../../../layouts/shop_app/shop_layout.dart';
import '../../../networks/local/cache_helper.dart';
import '../../../shared/components/componants.dart';
import '../../../shared/components/contstants.dart';

import 'RigesterCubit.dart';

class SocialRegist extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  SocialRegist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SocialRegistCubit(),
        child: BlocConsumer<SocialRegistCubit, SocialRegistState>(
            listener: (context, state) {
          if (state is SocialCreateUserState) {
            navigateandfinish(context, SocialLayout());

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
            // AwesomeDialog(
            //   context: context,
            //   dialogType: DialogType.warning,
            //   headerAnimationLoop: false,
            //   animType: AnimType.bottomSlide,
            //   title: '  WARNING   ',
            //   desc: 'تأكد من ادخالك لبياناتك بشكل صحيح.',
            //   buttonsTextStyle: const TextStyle(color: Colors.black),
            //   showCloseIcon: true,
            // ).show();
          }
        }, builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [Colors.deepOrange, Colors.orangeAccent])),
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(20, 140, 20, 0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 250),
                        child: Text(
                          'SignUp ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      defaultFormField(
                        controller: namecontroller,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return 'يجب إدخال اسم المستخدم';
                          }
                          return null;
                        },
                        type: TextInputType.text,
                        hint: 'اسم المستخدم',
                        prefix: Icons.person,
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      defaultFormField(
                        controller: emailcontroller,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return 'يجب إدخال الايميل';
                          }
                          return null;
                        },
                        type: TextInputType.text,
                        hint: 'الايميل الشخصي',
                        prefix: Icons.email,
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      defaultFormField(
                        controller: phonecontroller,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return 'يجب إدخال رقم الهاتف';
                          } else if (val.length < 12) {
                            return "يجب إدخال 12 محارف على الأقل";
                          }
                          return null;
                        },
                        type: TextInputType.number,
                        hint: ' رقم الهاتف',
                        prefix: Icons.phone,
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      defaultFormField(
                        controller: passwordcontroller,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return 'يجب إدخال كلمة المرور ';
                          } else if (val.length < 5) {
                            return "يجب إدخال 6 محارف على الأقل";
                          }
                          return null;
                        },
                        type: TextInputType.text,
                        hint: 'كلمة المرور ',
                        prefix: Icons.password,
                        suffix: SocialRegistCubit.get(context).suffix,
                        isPassword: SocialRegistCubit.get(context).isPassword,
                        suffixPressed: () {
                          SocialRegistCubit.get(context)
                              .changePasswordVisibility();
                        },
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      ConditionalBuilder(
                          condition: state is! SocialRegistLoadingState,
                          builder: (context) => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                                side: BorderSide(width: 2, color: Colors.white),
                                elevation: 5,
                                shape: RoundedRectangleBorder(),
                              ),
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  SocialRegistCubit.get(context).userRegist(
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text,
                                      phone: phonecontroller.text,
                                      name: namecontroller.text);
                                }
                              },
                              child: Text('تسجيل الدخول')),
                          fallback: (context) {
                            return Center(child: CircularProgressIndicator());
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
