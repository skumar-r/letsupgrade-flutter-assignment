import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Age Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyPage(title: 'Age to get 100'),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String name = "";
  int age = 0;
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          height: 500,
          child: Column(children: [
            Container(
              color: Colors.grey,
              margin: EdgeInsets.all(25.0),
              child: TextField(
                decoration: InputDecoration(hintText: "Name"),
                onChanged: (value) {
                  setState(() {
                    name = value;
                    num diff = 100 - age;
                    message = '$name is have $diff to reach 100 ';
                  });
                },
              ),
            ),
            Container(
              color: Colors.grey,
              margin: EdgeInsets.all(25.0),
              child: TextField(
                decoration: InputDecoration(hintText: "Age(in integer)"),
                onChanged: (value) {
                  setState(() {
                    if (value.trim().isNotEmpty) {
                      age = int.tryParse(value) == null ? 0 : int.parse(value);
                      num diff = 100 - age;
                      message = '$name is have $diff to reach 100 ';
                    } else {
                      message = '$name have 100 years to reach 100';
                    }
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(25.0),
              child: Text(message),
            )
          ]),
        ));
  }
}
