import 'package:flutter/material.dart';
class SearchEngine extends StatefulWidget {
  const SearchEngine({Key? key}) : super(key: key);

  @override
  State<SearchEngine> createState() => _SearchEngineState();
}

class _SearchEngineState extends State<SearchEngine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text("Page3"),),
    );
  }
}
