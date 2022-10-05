import 'package:flutter/material.dart';

class AssetVariantDetection69388 extends StatelessWidget {
  const AssetVariantDetection69388({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> assets = <String>[
      'assets/placeholder.png',
      'assets/something/placeholder.png',
    ];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
              'The first image should be a gray box (assets/placeholder.png) should be a gray rectangle, but it is not.'),
          ...List<Widget>.generate(
            assets.length,
            (int index) {
              return Expanded(
                child: SizedBox.expand(
                  child: Image.asset(assets[index], fit: BoxFit.cover),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
