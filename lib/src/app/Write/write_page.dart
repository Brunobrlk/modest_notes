import 'package:flutter/material.dart';

class WritePage extends StatelessWidget {
  final int index;
  WritePage({this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('-> $index'),),
    );
  }
}