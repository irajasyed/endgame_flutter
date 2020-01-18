import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ironman Wins!'),
      ),
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Image.asset('images/ironman_wins.gif'),
      ),
    );
  }
}
