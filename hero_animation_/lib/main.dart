import 'package:flutter/material.dart';

void main() => runApp(MyAPp());

class MyAPp extends StatelessWidget {
  const MyAPp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
            tag: "DemoTag",
            child: Icon(
              Icons.add,
              size: 70.0,
            )),
      ),
    );
  }
}
