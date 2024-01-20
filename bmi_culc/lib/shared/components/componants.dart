import 'package:bmi_culc/modules/web-view/web.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

var emailcontroller = TextEditingController();
var passwordcontroller = TextEditingController();

Widget defultbutton({
  double width = double.infinity,
  Color backgroundcolors = Colors.orange,
  required Function function,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: backgroundcolors,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
          // print(emailcontroller.text);
          // print(passwordcontroller.text);
        },
      ),
    );
Widget buildArticalItem(Map articels, BuildContext context) => InkWell(
      onTap: () {
        NavigateTo(context, webscreeen(articels['url']));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50, left: 20),
        child: Row(
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(
                        '${articels['urlToImage']}',
                      ),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 110,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${articels['title']}',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        maxLines: 4,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${articels['publishedAt']}',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

void NavigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigateandfinish(context, widget) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ), (route) {
      return false;
    });

Widget articleBuilder(List list, BuildContext context) => ConditionalBuilder(
    builder: (context) => ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) =>
              buildArticalItem(list[index], context),
          separatorBuilder: (BuildContext context, int index) =>
              Divider(thickness: 20),
        ),
    condition: list.length > 0,
    fallback: (context) => (Center(child: CircularProgressIndicator())));

Widget defaultFormField({
  required TextEditingController controller,
  required String? Function(String?) validate,
  required TextInputType type,
  required String hint,
  required IconData prefix,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? onTap,
  bool isPassword = false,
  IconData? suffix,
  void Function()? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        errorStyle: const TextStyle(height: 0.3),
        isDense: true,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 17),
        hintText: hint,
        hintStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
        prefixIcon: Icon(
          prefix,
          color: Colors.orangeAccent,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                  color: Colors.orangeAccent,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: const BorderSide(
            color: Colors.orange,
          ),
        ),
      ),
    );
