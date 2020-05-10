import 'package:flutter/material.dart';

class TestProductDetailes extends StatefulWidget {
  @override
  _TestProductDetailesState createState() => _TestProductDetailesState();
}

class _TestProductDetailesState extends State<TestProductDetailes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Image.network(
        'https://picsum.photos/250?image=9',
      ),
    );
  }
}
