import 'package:bmi_culc/models/shop_app/login.dart';
import 'package:bmi_culc/shared/components/componants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/shop_app/Login/shop_login.dart';
import '../../../networks/local/cache_helper.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class ShopSettings extends StatelessWidget {
  ShopSettings({super.key});
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        if (state is ShopSucsessUserState) {
          namecontroller.text = state.loginModel.data!.name!;
          phonecontroller.text = state.loginModel.data!.phone!;
          emailcontroller.text = state.loginModel.data!.email!;
        }
      },
      builder: (context, state) {
        var model = ShopCubit.get(context).usermodel;
        if (model!.data!.name! is Null) {
          CircularProgressIndicator();
        }
        namecontroller.text = model.data!.name!;
        phonecontroller.text = model.data!.phone!;
        emailcontroller.text = model.data!.email!;

        return ConditionalBuilder(
          condition: ShopCubit.get(context).usermodel != null,
          fallback: (context) => CircularProgressIndicator(),
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: namecontroller,
                  cursorColor: Colors.orange,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'name not be empty';
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      labelText: 'name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.orange,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  cursorColor: Colors.orange,
                  controller: emailcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'email not be empty';
                    }
                  },
                  decoration: InputDecoration(
                      hoverColor: Colors.orange,
                      filled: true,
                      fillColor: Colors.grey[200],
                      labelText: 'email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.orange,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      focusColor: Colors.orange),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  cursorColor: Colors.orange,
                  controller: phonecontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'name not be empty';
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      labelText: 'phone',
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.orange,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20.0,
                ),
                defultbutton(
                  function: () {
                    CacheHelper.removedata(key: 'token').then((value) {
                      if (value) {
                        navigateandfinish(context, shoplogin2());
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
