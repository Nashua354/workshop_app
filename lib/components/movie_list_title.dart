import 'package:flutter/material.dart';

class MovieListTitle extends StatelessWidget {
  final String title;
  MovieListTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
