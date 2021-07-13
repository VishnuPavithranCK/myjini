import 'package:flutter/material.dart';
import 'package:myjini/screens/signin.dart';
import 'package:myjini/widgets/custom_button.dart';
import 'package:myjini/widgets/custom_text_field.dart';
import '../models/shared.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerUserName = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  TextEditingController controllerPhone = new TextEditingController();
  String dropdownValue = 'Select Proffession';
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
        body: Column(
      children: [
        Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Opacity(
              opacity: 0.8,
              child: Image(
                image: AssetImage('lib/assets/back.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
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
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    autovalidate: false,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        CustomTextField(
                          hintText: 'Email',
                          validator: (value) {
                            String? emailId = value.toString();
                            if (emailId.trim().isEmpty) {
                              return "Email Id is Required";
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: controllerEmail,
                          obscureText: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          hintText: 'User Name',
                          validator: (value) {
                            String? name = value.toString();
                            if (name.trim().isEmpty) {
                              return "UserName is Required";
                            }
                          },
                          controller: controllerUserName,
                          keyboardType: TextInputType.name,
                          obscureText: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          hintText: 'Password',
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          controller: controllerPassword,
                          validator: (value) {
                            String? pass = value.toString();
                            if (pass.trim().isEmpty) {
                              return "Password is Required";
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Select Proffession',
                            'Developer',
                            'Test Engineer',
                            'Freelancer'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 10),
                        CustomButton(
                          buttonText: 'Sign up',
                          onPressed: () {
                            if ((formKey.currentState)!.validate()) {
                              var getEmail = controllerEmail.text;
                              var getUserName = controllerUserName.text;
                              var proff = dropdownValue;
                              var getPassword = controllerPassword.text;
                              var phone = controllerPhone.text;

                              MySharedPreferences.instance
                                  .setStringValue("email", getEmail);
                              MySharedPreferences.instance
                                  .setStringValue("name", getUserName);
                              MySharedPreferences.instance
                                  .setStringValue("password", getPassword);
                              MySharedPreferences.instance
                                  .setBooleanValue("loggedin", true);
                              MySharedPreferences.instance
                                  .setStringValue("proffession", proff);
                              MySharedPreferences.instance
                                  .setStringValue("phone", phone);

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => SignIn()),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            horizontalLine(),
                            Text(
                              'or sign up with',
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
                              Text('Have an account?'),
                              InkWell(
                                  child: Text('Sign In',
                                      style:
                                          TextStyle(color: Colors.yellow[800])),
                                  onTap: () {})
                            ])
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ],
    ));
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
