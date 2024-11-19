import 'package:techpicks/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:techpicks/screens/register.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ).copyWith(secondary: Colors.deepPurple[400]),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            fontFamily: 'Geist',
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.75,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.75,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextField(
                    controller: _usernameController,
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 16.0,
                      letterSpacing: -0.5,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      hintStyle: TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(107, 107, 107, 1),
                        fontSize: 16.0,
                        letterSpacing: -0.5,
                      ),
                      labelStyle: TextStyle(
                        fontFamily: 'Geist',
                        fontSize: 16.0,
                        letterSpacing: -0.5,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordController,
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 16.0,
                      letterSpacing: -0.5,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(107, 107, 107, 1),
                        fontSize: 16.0,
                        letterSpacing: -0.5,
                      ),
                      labelStyle: TextStyle(
                        fontFamily: 'Geist',
                        fontSize: 16.0,
                        letterSpacing: -0.5,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      final response = await request
                          .login("http://127.0.0.1:8000/auth/login/", {
                        'username': username,
                        'password': password,
                      });

                      if (request.loggedIn) {
                        String message = response['message'];
                        String uname = response['username'];
                        if (context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content:
                                Text("$message Welcome to TechPicks, $uname."),
                                backgroundColor: Color.fromRGBO(40,42,58,1),
                              )
                            );
                        }
                      } else {
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Failed to login.'),
                              content: Text(response['message']),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Color.fromRGBO(40,42,58,1),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        letterSpacing: -0.5,
                        color: Colors.white,
                      ),
                    )
                  ),
                  const SizedBox(height: 36.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Color.fromRGBO(40, 42, 58, 1),
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: -0.75,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Do not have an account yet? '),
                          TextSpan(
                            text: 'Register.',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}