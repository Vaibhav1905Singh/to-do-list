

import 'package:flutter/material.dart';
import 'package:todolistapp/login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 1, 1, 1)),
        useMaterial3: true,
      ),
      home: MyToDo(),
    );
  }
}

class MyToDo extends StatefulWidget {
  const MyToDo({super.key});

  @override
  State<MyToDo> createState() => _MyToDoState();
}

class _MyToDoState extends State<MyToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 125, 172),
        title: Center(child: Text('TO DO LIST'))
        
      ),
      
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyLogin()));
          },
          child: Icon(
            Icons.add,
            color: Color.fromARGB(255, 0, 0, 252),
          )),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
    );
  }
}
