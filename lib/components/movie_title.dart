import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  final String title;
  MovieTitle({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black])),
      width: 150,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        overflow: TextOverflow.fade,
        maxLines: 2,
      ),
    );
  }
}
