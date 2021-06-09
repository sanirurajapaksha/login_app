import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/globals.dart' as globals;
import 'package:new_app/requests.dart' as apiRequests;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 100, left: 30),
                    child: Text(
                      'Hello',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 180, left: 30),
                    child: Text(
                      'Create an Account',
                      style: GoogleFonts.montserrat(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 240, left: 30, right: 30),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.grey.withOpacity(0.6),
                        )
                      ],
                    ),
                    child: TextFormField(
                      validator: (text1) {
                        if (text1.isEmpty) {
                          return 'Name cannot be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          color: Colors.blue.withOpacity(0.6),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      onSaved: (newValue) {
                        globals.username = newValue;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 320, left: 30, right: 30),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.grey.withOpacity(0.6),
                        )
                      ],
                    ),
                    child: TextFormField(
                      validator: (text2) {
                        if (text2.isEmpty) {
                          return 'Email cannot be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.blue.withOpacity(0.6),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      onSaved: (newValue) {
                        globals.email = newValue;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 400, left: 30, right: 30),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.grey.withOpacity(0.6),
                        )
                      ],
                    ),
                    child: TextFormField(
                      validator: (text3) {
                        if (text3.isEmpty) {
                          return 'Country cannot be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Country',
                        hintStyle: TextStyle(
                          color: Colors.blue.withOpacity(0.6),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      onSaved: (value) {
                        globals.country = value;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 480, left: 30, right: 30),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.grey.withOpacity(0.6),
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 0),
                          child: TextFormField(
                            validator: (text4) {
                              if (text4.isEmpty) {
                                return 'Phone number cannot be empty';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                color: Colors.blue.withOpacity(0.6),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            onSaved: (x) {
                              globals.phone = x;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 560,
                      left: MediaQuery.of(context).size.width / 3,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Your Account created'),
                            ),
                          );
                          _formKey.currentState.save();
                          apiRequests.createUser();
                        }
                      },
                      child: Text('Create Account'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
