import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
              icon: const Icon(Icons.search)
          ),
        ],
      ),
      body: Container(),
    );
  }
}

  class MySearchDelegate extends SearchDelegate {
    List<String> searchTerms = [
      'username', 'username1'
    ];
    @override
    List<Widget> buildActions(BuildContext context) {
      return[
         IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
      ];
    }

    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
      );
    }

    @override
    Widget buildResults(BuildContext context) {
      List<String> matchQuery = [];
      for ( var user in searchTerms) {
        if(user.toLowerCase().contains(query.toLowerCase())){
          matchQuery.add(user);
        }
      }
      return ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            var result = matchQuery[index];
            return ListTile(
              title: Text(result),
            );
          }
      );

    }

    @override
    Widget buildSuggestions(BuildContext context) {
      List<String> matchQuery = [];
      for (var user in searchTerms){
        if(user.toLowerCase().contains(query.toLowerCase())){
          matchQuery.add(user);
        }
      }
      return ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            var result = matchQuery[index];
            return ListTile(
              title: Text(result),
            );
          }
      );
    }
  }
