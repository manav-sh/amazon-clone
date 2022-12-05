import 'package:flutter/material.dart';

class Loading {
  static Widget image(double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[100],
      ),
      child: Center(
        child: Icon(Icons.image, color: Colors.grey[700], size: 35),
      ),
    );
  }
}
