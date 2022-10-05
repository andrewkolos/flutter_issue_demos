import 'package:flutter/material.dart';

class SpecialChars111020 extends StatelessWidget {
  const SpecialChars111020({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: SizedBox.expand(
              child: Image.asset('assets/사진.jpeg', fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
