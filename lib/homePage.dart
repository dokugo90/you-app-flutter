import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mong/mail.dart';
import 'dart:io';
import 'dart:convert';

import 'package:mong/main.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static String username = _MainPageState.name;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  static String name = "";
  String age = "";

  List dataList = <dynamic>[];

  void getData() async {
    try {
    Uri url = Uri.parse("http://192.168.88.20:5000/mongo");
    // When using a android emulator use your ip address but when it is on web use localhost
    var req = await http.get(url);
    var res = jsonDecode(req.body);
    setState(() {
      dataList = res;
    });
    //print(dataList);
    } catch(err) {
      print("$err try again");
      setState(() {
        dataList = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override disposeState() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: 
        IconButton(icon: Icon(Icons.person_add, color: Colors.black,), onPressed: (() {
            MyHomePage.pageControls.jumpToPage(MyHomePage.PageIndex + 1);
        }),),
        centerTitle: true,
        title: Text("You", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),),
      ),
      
      body: Center(

        child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
                title: Text(dataList[index]["name"].toString(), textAlign: TextAlign.center,),
                subtitle: GestureDetector(
                  child: Text(dataList[index]["email"].toString(), textAlign: TextAlign.center,),
                ),
                onTap: (() {
                  
                  Navigator.push(context, MaterialPageRoute(builder: ((context) {
                   return MailPage(name: dataList[index]["name"].toString(), bio: dataList[index]["bio"].toString(), age: dataList[index]["age"].toString(), email: dataList[index]["email"].toString(), image: dataList[index]["image"].toString(),);
                  })));
                }),
                leading: Text("Age: ${dataList[index]["age"].toString()}"),
                trailing: Image(image: NetworkImage(dataList[index]["image"].toString()), fit: BoxFit.contain,),
            ),
          );
        }))
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}