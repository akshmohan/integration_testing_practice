// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:integration/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

   void _login() {
    if(_emailController.text == "email" && _passwordController.text == "password") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      showDialog(context: context, builder: (BuildContext context) {
        return  AlertDialog(
          title:  Text("Error"),
          content:  Text("Invalid email or password"),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text("ok"))
          ]
        );
      });
    }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            margin: const EdgeInsets.only(top: 150),
            child: Column(
              children: [
                TextFormField(
                  key: Key("email_controller"),
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Please enter your email",
                    label: const Text('Email'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  key: Key("password_controller"),
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      label: Text("Password"),
                      hintText: "Please enter your password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    )),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _login,
                  child: const Text("Login", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ));
  }
}
