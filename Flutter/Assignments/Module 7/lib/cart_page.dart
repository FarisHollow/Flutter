import 'package:flutter/material.dart';

class Cart_Page extends StatelessWidget {
  final int totalProducts;

  const Cart_Page({required this.totalProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Text('Total Products: $totalProducts'),
      ),
    );
  }
}
