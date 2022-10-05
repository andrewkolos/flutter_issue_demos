import 'package:flutter/material.dart';

class SpecialChars111020 extends StatelessWidget {
  const SpecialChars111020({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('''
There is error loading the image below, because the actual filename and the name
provided below in the Image widget are encoded differently. One is in composed form,
and the other is in decomposed form.
'''),
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
