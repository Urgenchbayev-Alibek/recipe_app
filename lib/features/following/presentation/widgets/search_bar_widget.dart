
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 355,
        height: 34,
        decoration: BoxDecoration(
          color: Colors.pink.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child:  TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 8),
            prefixIcon: Icon(Icons.search, color: Colors.pink),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.pink),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
