import 'package:flutter/material.dart';
import 'package:taejai/models/person.dart';
import 'package:taejai/pages/project/project_list_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Person p = Person(
      name: 'Paramak',
      surname: 'Pathompetai',
      id: '630710039'
    );

    return MaterialApp(
      title: 'Person',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Person Test'),
          backgroundColor: Colors.orange,

        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: Container(
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.green,
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}