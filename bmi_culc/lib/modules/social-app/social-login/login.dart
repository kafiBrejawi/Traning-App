import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi_culc/modules/social-app/home/HomeScreen.dart';
import 'package:bmi_culc/modules/social-app/social-login/state.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/Social_app/SocialLayouts.dart';
import '../../../networks/local/cache_helper.dart';
import '../../../shared/components/componants.dart';
import '../../shop_app/register/shop_app_rigester.dart';
import '../rigesterscreen/rigester.dart';
import 'cubit.dart';

class LoginSocial extends StatelessWidget {
  LoginSocial({super.key});
  var formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => socialLoginCubit(),
        child: BlocConsumer<socialLoginCubit, socialLoginState>(
          listener: (context, state) {
            if (state is socialLoginErrorState) {
              AwesomeDialog(
                borderSide: BorderSide(color: Colors.orange, width: 2),
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
            if (state is socialLoginSucsessState) {
              CacheHelper.savedata(key: 'uid', value: state.uid).then((value) {
                navigateandfinish(context, SocialLayout());
              });
            }
          },
        ));
  }
}
