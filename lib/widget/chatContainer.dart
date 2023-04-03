// ignore_for_file: file_names

import 'package:chat_app/models/model.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Message messages;

  const CustomContainer({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          color: Colors.indigo.shade900,
        ),
        child: Text(
          messages.message,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}

class CustomContainer1 extends StatelessWidget {
  final Message messages;

  const CustomContainer1({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30)),
            color: Colors.indigo.shade300),
        child: Text(
          messages.message,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
