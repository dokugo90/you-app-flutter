import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mong/create.dart';
import 'dart:io';
import 'dart:convert';

import 'package:mong/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  static int PageIndex = _MyHomePageState._currentPage;
  static PageController pageControls = _MyHomePageState._controller;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 static final PageController _controller = PageController(
initialPage: 0,
  );

  static int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      onPageChanged: (int value) {
        setState(() {
          _currentPage = value;
        });
      },
      children: <Widget>[
        MainPage(),
        CreatePage()
      ],
    );
  }
}
