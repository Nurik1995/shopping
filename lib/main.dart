import 'package:flutter/material.dart';
import 'package:shopping/screens/home/home_screen.dart';
// import 'package:shopping/HomeScreen.dart';
import 'package:shopping/signup.dart';
import 'package:shopping/login.dart';
// import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String title = 'Login and Signup';

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DefaultTabController(
        length: 2,
        child: MyHomePage(title: title),
      ),
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
// final List<Tab> myTabs = <Tab>[
//     new Tab(text: 'LEFT'),
//     new Tab(text: 'RIGHT'),
//   ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Login'),
            Tab(text: 'Signup'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          LoginCard(),
          SignupCard(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _tabController
            .animateTo((_tabController.index + 1) % 2), // Switch tabs
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }
}
