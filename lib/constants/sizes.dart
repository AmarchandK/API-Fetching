import 'package:flutter/material.dart';

const SizedBox h20 = SizedBox(height: 20);
const SizedBox h10 = SizedBox(height: 10);
const SizedBox h5 = SizedBox(height: 5);
const SizedBox h30 = SizedBox(height: 30);
const SizedBox w10 = SizedBox(width: 10);
const SizedBox w20 = SizedBox(width: 20);

double widthSize(context) {
  return MediaQuery.of(context).size.width;
}

double heightSize(context) {
  return MediaQuery.of(context).size.height;
}
