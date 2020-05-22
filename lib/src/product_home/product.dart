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
              title: Text('App bar of 1000 bit'),
            ),
            body: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.black,
                body: Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      Expanded(
                        child: Column(children: [
                          Container(height: 120.0, color: Colors.yellow),
                          Container(height: 100.0, color: Colors.cyan),
                          Container(height: 120.0, color: Colors.blue),
                          Container(height: 100.0, color: Colors.green),
                        ]),
                      ),
                    ])),
              ),
            )));
  }
}
