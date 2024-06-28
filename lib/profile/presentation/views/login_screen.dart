import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ztech_mobile_application/common/utils/local_persistance.dart';
import 'package:ztech_mobile_application/common/widgets/diagonal_background_painter.dart';
import 'package:ztech_mobile_application/iam/services/firebase_auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final LocalPersistance _localPersistance = LocalPersistance();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _showPassword = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (!_isValidEmail(email)) {
      _showErrorDialog("Invalid email format");
      return;
    }

    try {
      User? user = await _auth.signInWithEmailAndPassword(email, password);

      if (user == null) {
        _showErrorDialog("Incorrect credentials");
        return;
      }

      final plantOwnersResponse = await http.get(Uri.parse('http://ztech-web-service-production.up.railway.app/api/v1/plant/owners'));
      final plantOwnersData = json.decode(plantOwnersResponse.body) as List;

      final suppliersResponse = await http.get(Uri.parse('http://ztech-web-service-production.up.railway.app/api/v1/suppliers'));
      final suppliersData = json.decode(suppliersResponse.body) as List;

      bool emailExists = false;
      String type = 'default';

      for (var plantOwner in plantOwnersData) {
        if (plantOwner['email'] == email) {
          emailExists = true;
          type = 'plantOwner';
          _localPersistance.setUser(plantOwner);
          break;
        }
      }

      for (var supplier in suppliersData) {
        if (supplier['email'] == email) {
          emailExists = true;
          type = 'supplier';
          _localPersistance.setUser(supplier);
          break;
        }
      }

      if (emailExists) {
        Navigator.of(context).pushReplacementNamed('flowerpots');
      } else {
        _showErrorDialog("Account does not exist");
      }
    } catch (e) {
      _showErrorDialog("Authentication error: ${e.toString()}");
    }
  }

  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomPaint(
          painter: DiagonalBackgroundPainter(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Image.asset(
                    'assets/Logo-ztech-inicio.png',
                    width: 250,
                    height: 250,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Log in to your account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        child: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        activeColor: const Color(0xFF276749),
                        value: _rememberMe,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _rememberMe = newValue!;
                          });
                        },
                      ),
                      const Text('Remember me',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _signIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF276749),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 140, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Do not you remember your password? ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Enter Here',
                          style: const TextStyle(color: Color(0xFF276749)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, 'recover-password');
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'You do not have an account? ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Enter Here',
                            style: const TextStyle(color: Color(0xFF276749)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, 'register');
                              },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}