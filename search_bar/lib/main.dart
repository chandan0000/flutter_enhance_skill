import 'package:flutter/material.dart';

import 'list_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter demo",
      theme: ThemeData(primaryColor: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Food items'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: FoodItemSearch());
              },
              icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}

class FoodItemSearch extends SearchDelegate<FoodItem> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null!);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty
        ? loadFoodItem()
        : loadFoodItem().where((p) => p.title.startsWith(query)).toList();

    return mylist.isEmpty
        ? Text(
            'No Results found...',
            style: TextStyle(fontSize: 20),
          )
        : ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              final FoodItem listitem = mylist[index];
              return ListTile(
                onTap: () {
                  showResults(context);
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listitem.title,
                      style: const TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Text(listitem.category),
                    const Divider()
                  ],
                ),
              );
            });
  }
}
