import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

import 'package:mong/homePage.dart';

class MailPage extends StatefulWidget {
  dynamic name = "";
  dynamic bio = "";
  dynamic age = "";
  dynamic email = "";
  dynamic image = "";
  MailPage({super.key, this.name, this.bio, this.age, this.email, this.image});

  @override
  State<MailPage> createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {

  String name = "";
  String bio = "";
  String age = "";
  String email = "";
  String image = "";

   @override
  void initState() {
    super.initState();
    name = widget.name;
    bio = widget.bio;
    age = widget.age;
    email = widget.email;
    image = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: () {
          setState(() {
            MainPage.username = "";
          });
          Navigator.pop(context);
        },),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(image),
            ),
          )
        ],
        backgroundColor: Colors.white,
        title: Text("More About" + " " + name, style: TextStyle(color: Colors.black, fontSize: 20),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Column(
                  children: <Widget>[
                    RichText(text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: "Age: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 14)),
                          TextSpan(text: age, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 12)),
                          TextSpan(text: "\n\nEmail: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 14)),
                          TextSpan(text: email, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 12)),
                          TextSpan(text: "\n\nBio: ",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 14)),
                          TextSpan(text: bio,  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 12))
                          
                      ]
                    )),

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