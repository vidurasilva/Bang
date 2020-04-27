import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final String catogory;
  const ProductPage(String categori, {Key key, this.catogory})
      : super(key: key);
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('App vidura bar'),
        ),
        body: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.black,
        )),
      ),
    );
  }
}
