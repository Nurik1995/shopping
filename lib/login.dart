import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;
import 'package:session_storage/session_storage.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _SignupCardState();
}

class _SignupCardState extends State<LoginCard> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  loginFunc(BuildContext context) async {
    var response = await http.post(
      Uri.parse('${globals.ipAddress}/insert/shopping_login.php'),
      body: {
        'login': loginController.text,
        'password': passwordController.text,
      },
    );

    var body = response.body;
    print(body);

    Map<String, dynamic> result = jsonDecode(body);
    print(result);

    if (result['result'] == 1) {
      print("Login is successful");
      globals.snackbarMessage(context, "Welcome");

      SessionStorage().addAll({'user': loginController.text});

      Navigator.pushNamed(
        context,
        '/home',
        arguments: {'nick': "Nurlan", 'value': 15},
      );
    } else if (result['result'] == 0) {
      print("Login or password is incorrect");
      globals.snackbarMessage(context, "Login or password is incorrect");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20.0),
        // child: Padding(
        //   padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: loginController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your User name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    loginFunc(context);
                  } else {
                    globals.snackbarMessage(context, "Fill in the fields!");
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
