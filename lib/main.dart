import 'package:flutter/material.dart';

import 'widget/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Netflix',
      theme: theme.copyWith(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        colorScheme: theme.colorScheme.copyWith(
          secondary: Colors.white,
        ),
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(),
              Container(),
              Container(),
              Container(),
            ],
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}
