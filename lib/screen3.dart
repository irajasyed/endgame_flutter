import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanos Wins!'),
      ),
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Image.asset('images/thanos_wins.gif'),
      ),
    );
  }
}
