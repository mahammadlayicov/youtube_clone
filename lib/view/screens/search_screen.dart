import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      actions: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade700,
          child: IconButton(
            icon: Icon(Icons.mic),
            onPressed: () {},
          ),
        ),
      ],
      title: TextField(
        decoration: InputDecoration(
          hintText: 'Search Youtube',
          border: InputBorder.none,
        ),
      ),
    ));
  }
}
