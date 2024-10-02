// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({
    super.key,
    required this.soyad,
    required this.sira,
  });

  final dynamic soyad;
  final dynamic sira;

  @override
  Widget build(BuildContext context) {
    print(soyad);
    return Center(
      child: ElevatedButton(
        // child: const Text('FINAL'),
        child: Text(soyad),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
