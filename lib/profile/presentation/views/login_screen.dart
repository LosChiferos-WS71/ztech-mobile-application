import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/widgets/diagonal_background_painter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  bool _showPassword = false;

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
                  const SizedBox(height: 100),
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
                    onPressed: () {
                      Navigator.pushNamed(context, 'choose-plant');
                    },
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
                              // Aquí puedes manejar la navegación a la pantalla de recuperación de contraseña
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
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
                              // Aquí puedes manejar la navegación a la pantalla de registro
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
