import 'package:bmi_culc/shared/components/componants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: formkey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "LOGIN",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailcontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'email address not be empty';
                          }
                          return null;
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
                        height: 25,
                      ),
                      TextFormField(
                        controller: passwordcontroller,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscureText,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password not be empty';
                          }
                          return null;
                        },
                        onFieldSubmitted: ((value) {
                          print(value);
                        }),
                        decoration: InputDecoration(
                            labelText: 'password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.password),
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
                      defultbutton(
                        width: double.infinity,
                        backgroundcolors: Colors.blue,
                        function: () {
                          if (formkey.currentState!.validate()) {
                            print(emailcontroller.text);
                            print(passwordcontroller.text);
                          }
                        },
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
