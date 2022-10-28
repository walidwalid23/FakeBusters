import 'dart:ui';

import 'package:flutter/material.dart';



class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);
 
  @override
  State<Search> createState() => _SearchState();
}
 
class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search",
        ),
        actions: [
          IconButton(
            onPressed: () {null;},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body:
        Image.asset('assets/images/search.png'),
    );
  }
}

