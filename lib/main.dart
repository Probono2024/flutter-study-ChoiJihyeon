import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Center(
          child: Container(
            width: 450,
            height: 450,
            color: Colors.blue,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Hello, Flutter!'),
                  Image.asset('probono.jpg'),
                  Icon(Icons.star),
                ],
              ),)
          ),
        )
    );
  }
}
