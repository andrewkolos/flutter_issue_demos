import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:flutter_shaders/flutter_shaders.dart';

class AssetShader126829 extends StatelessWidget {
  const AssetShader126829({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('This widget loads a fragment shader as an asset and also '
          'demonstrates the shader using ShaderBuilder from package:flutter_shaders. '
          'An exception gets thrown: "Asset \'shaders/simple.frag\' gets does not contain '
          'valid shader data." However, if the shader is removed from the assets '
          'section in pubspec.yaml, then the shader renders just fine.\n'),
          FutureBuilder<String>(
            future: rootBundle.loadString('shaders/simple.frag'),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Text('${snapshot.data!.substring(0, 200)}...', style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 10),);
              } else if (snapshot.hasError) {
                return const Text('something went wrong');
              } else {
                return const CircularProgressIndicator();
              }
          }),
          ShaderBuilder(
            assetKey: 'shaders/simple.frag',
            (context, shader, child) => CustomPaint(
              size: const Size(300, 300),
              painter: ShaderPainter(
                shader: shader,
              ),
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}

class ShaderPainter extends CustomPainter {
  ShaderPainter({required this.shader});
  ui.FragmentShader shader;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    final paint = Paint()..shader = shader;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}