import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:post_request/widgets/decoration_field.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('your url'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: <String, String>{
        'user_email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Login successful, handle response here
      print(response.body);
    } else {
      print(response);
      // Login failed, handle error here
      print('Login failed: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                height: 500,
                width: 700,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29)),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 100, right: 100),
                      child: TextFormField(
                        controller: _emailController,
                        decoration:
                            inputFieldDecoration(label: "email", hintText: ""),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          return value!.isEmpty ? 'Please add an email' : null;
                        },
                      ),
                    ),
                    SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.only(left: 100, right: 100),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: inputFieldDecoration(
                            label: " password", hintText: ""),
                        obscureText: true,
                        validator: (value) {
                          return value!.isEmpty
                              ? 'Please enter your password'
                              : null;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        loginUser(email, password);
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
