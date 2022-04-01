import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
        title: 'flutter datepicker',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _dateTime = DateTime(2100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${_dateTime.day}-${_dateTime.month}-${_dateTime.year}',
              style: const TextStyle(fontSize: 40),
            ),
            ElevatedButton(
                onPressed: () async {
                  DateTime? _newDate = await showDatePicker(
                      context: context,
                      initialDate: _dateTime,
                      firstDate: DateTime(1800),
                      lastDate: DateTime(3000));
                  if (_newDate != null) {
                    setState(() {
                      _dateTime = _newDate;
                    });
                  }
                },
                child: const Text('Get Date')),
          ],
        ),
      ),
    );
  }
}
