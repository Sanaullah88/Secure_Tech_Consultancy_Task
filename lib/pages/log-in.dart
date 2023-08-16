import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/all-products.dart';
import 'package:myapp/utils.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    final url = Uri.parse("https://fakestoreapi.com/auth/login");
    final response = await http.post(
      url,
      body: {
        "username": userController.text,
        "password": passwordController.text,
      },
    );

print(response.statusCode);
    if (response.statusCode == 200) {
    setState(() {
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AllProduct()),
      );
    });
     
    } else {
      print("Login failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController password = TextEditingController();
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0 * fem, 4 * fem),
              blurRadius: 2 * fem,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                  21 * fem, 14.33 * fem, 14.34 * fem, 30 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-1, -0.002),
                  end: Alignment(1, -0.002),
                  colors: <Color>[Color(0xff188095), Color(0xff2ab3c6)],
                  stops: <double>[0, 1],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 7.66 * fem, 70 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 225 * fem,
                    ),
                    child: Text(
                      ' STC \nHEALTH \n',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 36 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2102272246 * ffem / fem,
                        letterSpacing: -0.3000000119 * fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 256.66 * fem, 0 * fem),
                    child: Text(
                      'Log In',
                      style: SafeGoogleFont(
                        'SF Pro Display',
                        fontSize: 34 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.193359375 * ffem / fem,
                        letterSpacing: -0.3000000119 * fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.fromLTRB(36 * fem, 54 * fem, 28 * fem, 110 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 24 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 32 * fem),
                          width: 342 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: TextField(
                                  controller: userController,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 13 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.6923076923 * ffem / fem,
                                      letterSpacing: -0.4079999924 * fem,
                                      color: Color(0xd8000000),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 342 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    6 * fem, 0 * fem, 17.61 * fem, 10.5 * fem),
                                width: double.infinity,
                                height: 54 * fem,
                                child: Stack(
                                  children: [
                                    Container(
                                child: TextField(
                                  controller: passwordController,
                      obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Pasword',
                                    labelStyle: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 13 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.6923076923 * ffem / fem,
                                      letterSpacing: -0.4079999924 * fem,
                                      color: Color(0xd8000000),
                                    ),
                                  ),
                                ),
                              ),
                                    
                                  ],
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: loginUser,

                    child: Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 8 * fem, 43 * fem),
                        padding: EdgeInsets.fromLTRB(
                            113 * fem, 27 * fem, 113 * fem, 27 * fem),
                        width: 342 * fem,
                        height: 74 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xff2ab3c6),
                          borderRadius: BorderRadius.circular(62 * fem),
                        ),
                        child: Center(
                          child: Center(
                            child: SizedBox(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 116 * fem,
                                ),
                                child: Text(
                                  'Continue',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'SF Pro Display',
                                    fontSize: 17 * ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 0.1470588235 * ffem / fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 8 * fem, 0 * fem),
                      child: Text(
                        'NEED HELP?',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'SF Pro Text',
                          fontSize: 15 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.193359375 * ffem / fem,
                          letterSpacing: -0.4079999924 * fem,
                          color: Color(0xa5000000),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
