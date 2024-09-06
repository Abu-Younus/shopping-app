import 'package:flutter/material.dart';
import 'package:shopping_app/my_bag.dart';

void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Bag',
      home: MyBag(),
    );
  }
}
