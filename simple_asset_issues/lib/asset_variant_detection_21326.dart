import 'package:flutter/material.dart';

class AssetVariantDetection21326 extends StatelessWidget {
  const AssetVariantDetection21326({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> assets = <String>[
      'assets/blue_square.jpg',
      'assets/purple square.jpg',
    ];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
              'Both squares have 2x and 3x variants. However, because the purple square has a space in its filenames (purple square.jpg), it always loads the 1x variant, even if the device has a very high pixel ratio.'),
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
