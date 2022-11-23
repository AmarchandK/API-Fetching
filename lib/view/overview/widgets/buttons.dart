import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                ),
              ],
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 18, 49, 64),
                  Color.fromARGB(255, 59, 79, 88),
                  Color.fromARGB(255, 70, 80, 85),
                ],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
              ),
            ),
            child: const Center(
              child: Text(
                "Make Offer",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          height: 50,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
              ),
            ],
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 18, 49, 64),
                Color.fromARGB(255, 59, 79, 88),
                Color.fromARGB(255, 70, 80, 85),
              ],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.messenger_outline,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }
}
