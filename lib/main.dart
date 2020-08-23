import 'package:News_App/screens/home.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('News App'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
        child: Home(),  
        color: Color.fromRGBO(19, 19, 19, 1),
        ),
      ),
    );
  }
}