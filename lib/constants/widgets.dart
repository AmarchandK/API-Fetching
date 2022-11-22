import 'package:deep_nucleus/constants/sizes.dart';
import 'package:flutter/material.dart';

Divider customDivider = const Divider(
  indent: 10,
  endIndent: 10,
);

class Specs extends StatelessWidget {
  const Specs({super.key, required this.tittle, required this.content});
  final String content;
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [contentText(tittle), h5, contents(content)],
    );
  }
}

Text contents(String text) {
  return Text(
    text,
    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  );
}

Widget contentText(String text) {
  return Text(
    text,
    style: const TextStyle(
        color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 18),
  );
}

Widget headingText(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      text,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
    ),
  );
}

RichText twoColorText(String text1, String text2) {
  return RichText(
    text: TextSpan(
      text: text1,
      style: const TextStyle(
        color: Colors.black,
      ),
      children: [
        TextSpan(
          text: text2,
          style: const TextStyle(
            color: Colors.blue,
          ),
        ),
      ],
    ),
  );
}
