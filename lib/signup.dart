import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;
import 'package:session_storage/session_storage.dart';

class SignupCard extends StatefulWidget {
  const SignupCard({super.key});

  @override
  State<SignupCard> createState() => _SignupCardState();
}

class _SignupCardState extends State<SignupCard> {
  TextEditingController loginController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  signupFunc(BuildContext context) async {
    var response = await http.post(
      Uri.parse('${globals.ipAddress}/insert/shopping_signup.php'),
      body: {
        'login': loginController.text,
        'email': emailController.text,
        'password': passwordController.text,
      },
    );

    var body = response.body;
    print(body);

    Map<String, dynamic> result = jsonDecode(body);
    print(result);

    if (result['result'] == 1) {
      print("New record created successfully");
      globals.snackbarMessage(context, "Signed");

      // SessionManager().setString('customer', 'night');

      SessionStorage().addAll({'language': 'azeri', 'name': 'Sessiyaci'});

      Navigator.pushNamed(
        context,
        '/home',
        arguments: {'nick': "Nurlan", 'value': 15},
      );
    } else if (result['result'] == 2) {
      print("This login name exists, create different one, please");
      globals.snackbarMessage(
          context, "This login name exists, create different one, please");
    } else {
      print("ERROR !");
      globals.snackbarMessage(context, "Error happened!");
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
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
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
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    signupFunc(context);
                  } else {
                    globals.snackbarMessage(context, "Fill in the fields!");
                  }
                },
                child: const Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
