import 'package:flutter/material.dart';
import 'package:shopping/HomeScreen2.dart';

class HomeScreen3 extends StatelessWidget {
  const HomeScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    // final arguments = (ModalRoute.of(context)?.settings.arguments ??
    //     <String, dynamic>{}) as Map;

    dynamic arguments = ModalRoute.of(context)?.settings.arguments;

    print(arguments);
    print(arguments['nick']);
    print(arguments['value']);

    return Center(
      child: ElevatedButton(
        child: const Text('Open route'),
        onPressed: () {
          // Navigator.pop(context); //geriye qayitmaq
          Navigator.push(
            //route-suz skrine kecid
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const HomeScreen2(soyad: "Karimli", sira: 25)),
          );
        },
      ),
    );
  }
}
