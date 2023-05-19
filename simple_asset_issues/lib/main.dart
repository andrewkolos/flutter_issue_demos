import 'package:asset_test_app/asset_shader_126829.dart';
import 'package:asset_test_app/assets_special_chars_11020.dart';
import 'package:flutter/material.dart';

import 'asset_variant_detection_69388.dart';

import 'asset_variant_detection_21326.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bug Reproduction',
      home: Scaffold(
        appBar: AppBar(title: const Text('Bug Directory')),
        body: const IssueDirectory(),
      ),
    );
  }
}

class IssueDirectory extends StatelessWidget {
  const IssueDirectory({super.key});

  @override
  Widget build(BuildContext context) {
    const routes = <_RouteItem>[
      _RouteItem(
        name:
            '#69388 Asset variant detection should only work on directory names that are parse-able by the framework (2x, 3x)',
        page: AssetVariantDetection69388(),
      ),
      _RouteItem(
        name:
            '#21326 Assets with Space in file names loads only default resolution',
        page: AssetVariantDetection21326(),
      ),
      _RouteItem(name: "#111020 can't load assets if the filename contains special characters", page: SpecialChars111020()),
      _RouteItem(name: "#126829 can't load shader if it's declared as an asset", page: AssetShader126829())
    ];
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      itemCount: routes.length,
      itemBuilder: (BuildContext builderContext, int index) => Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(builderContext).push<void>(
              MaterialPageRoute(builder: (_) => routes[index].page),
            );
          },
          child: Text(routes[index].name),
        ),
      ),
    );
  }
}

@immutable
class _RouteItem {
  const _RouteItem({required this.name, required this.page});

  final String name;
  final Widget page;
}
