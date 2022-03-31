import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyPage());
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  StreamController<int> counterController = StreamController<int>();

  late Stream myStream;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myStream = counterController.stream.asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: myStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.toString(),
                      style:
                          TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                    );
                  } else {
                    return Text(
                      "0",
                      style:
                          TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                    );
                  }
                },
              ),
              StreamBuilder(
                stream: myStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.toString(),
                      style:
                          TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                    );
                  } else {
                    return Text(
                      "0",
                      style:
                          TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          counterController.sink.add(counter);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}