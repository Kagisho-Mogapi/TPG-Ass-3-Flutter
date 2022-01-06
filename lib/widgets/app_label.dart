import 'package:flutter/material.dart';

class AppLabel extends StatelessWidget {
  const AppLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        child: Center(
          child: Text(
            'Daily forecast',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        height: 40,
        width: 140,
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
