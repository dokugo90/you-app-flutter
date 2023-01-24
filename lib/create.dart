import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mong/main.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  String name = "";
  String age = "";
  String image = "";
  String email = "";
  String bio = "";

    void sendData() async {
    try {
       Uri addPost = Uri.parse("http://192.168.88.20:5000/test");
       // When using a android emulator use your ip address but when it is on web use localhost
    var poster = await http.post(addPost, body: {"name": name, "age": age, "image": image != "" ? image : "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80", "email": email, "bio": bio});
    //print(poster.body);
    } catch(err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.home, color: Colors.black,), onPressed: (() {
          MyHomePage.pageControls.jumpToPage(MyHomePage.PageIndex - 1);
        }),),
        shadowColor: Colors.white,
        centerTitle: true,
        title: Text("You", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Add You", style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900),),
              Padding(padding: EdgeInsets.all(26)),
              SizedBox(
                width: 300,
                child: TextField(
                  onChanged: (String value) {
                    setState(() {
                      name = value;
                    });
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    labelText: "Name",
                    hintText: "Enter your name"
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(16)),
              SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (String value) {
                    setState(() {
                      age = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    labelText: "Age",
                    hintText: "Enter your age"
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(16)),
              SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (String value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    labelText: "Email",
                    hintText: "Enter your email"
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(16)),
              SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (String value) {
                    setState(() {
                      bio = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    labelText: "Bio",
                    hintText: "Tell us about yourself(hobbies, occupation, etc)"
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(16)),
              SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (String value) {
                    setState(() {
                      image = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    labelText: "Image Url",
                    hintText: "Example: https://image.com"
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendData,
        tooltip: "Add You",
        child: Icon(Icons.add),
      ),
    );
  }
}