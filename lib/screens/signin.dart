import 'package:flutter/material.dart';
import 'package:myjini/screens/details.dart';

import 'package:myjini/widgets/custom_button.dart';
import 'package:myjini/widgets/custom_text_field.dart';

import '../models/shared.dart';

class SignIn extends StatefulWidget {
  static const String routeName = 'signInPage';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignInState();
  }
}

class SignInState extends State<SignIn> {
  String email = "";
  String password = "";

  SignInState() {
    MySharedPreferences.instance
        .getStringValue("email")
        .then((value) => setState(() {
              email = value;
            }));

    MySharedPreferences.instance
        .getStringValue("password")
        .then((value) => setState(() {
              password = value;
            }));
  }
  TextEditingController emailEnter = TextEditingController();
  TextEditingController passEnter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Opacity(
                    opacity: 0.8,
                    child: Image(
                      image: AssetImage(
                        'lib/assets/back.jpg',
                      ),
                      fit: BoxFit.fitHeight,
                    )),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 9,
                left: 30,
                child: Container(
                  child: Text(
                    'Welcome!!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 5,
                child: Container(
                  padding: EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              CustomTextField(
                                hintText: 'Email',
                                validator: (value) {
                                  if (emailEnter.text.isEmpty) {
                                    return "Enter email";
                                  }
                                },
                                controller: emailEnter,
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 10),
                              CustomTextField(
                                hintText: 'Password',
                                validator: (value) {
                                  if (passEnter.text.isEmpty) {
                                    return "Enter password";
                                  }
                                },
                                controller: passEnter,
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 15),
                                  ),
                                  onTap: () {})
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomButton(
                              buttonText: 'Sign In',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (emailEnter.text != email) {
                                    return errorDialog(
                                        context: context,
                                        errorText: "email error");
                                  }
                                  if (passEnter.text != password) {
                                    return errorDialog(
                                        context: context,
                                        errorText: "pass error");
                                  }
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Details()));
                                }
                              }),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              horizontalLine(),
                              Text(
                                'or Sign In with',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              horizontalLine(),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 27,
                                  width: 27,
                                  child: Image.asset('lib/assets/google.png'),
                                ),
                                SizedBox(width: 20),
                                Container(
                                  height: 27,
                                  width: 27,
                                  child: Image.asset('lib/assets/facebook.png'),
                                ),
                              ]),
                          SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an Account?"),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                    child: Text('Sign Up',
                                        style: TextStyle(
                                            color: Colors.purple[800],
                                            fontWeight: FontWeight.bold)),
                                    onTap: () {})
                              ])
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void errorDialog({required BuildContext context, required String errorText}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Mismatch'),
            content: Container(
              child: Text(errorText),
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close))
            ],
          );
        });
  }

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: 90,
          height: 1.0,
          color: Colors.black26.withOpacity(.4),
        ),
      );
}
