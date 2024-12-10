import 'package:flutter/material.dart';
import 'package:shopping/HomeScreen2.dart';
import 'package:session_storage/session_storage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final arguments = (ModalRoute.of(context)?.settings.arguments ??
    //     <String, dynamic>{}) as Map;
    dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    print(arguments);
    print(arguments['nick']);
    print(arguments['value']);

    // Future<String> sessionKey = SessionManager().getString("customer");
    // print(sessionKey);

    final session = SessionStorage();
    print(session['name']);

    return Center(
      child: ElevatedButton(
        child: Text('${session['name']}'),
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
