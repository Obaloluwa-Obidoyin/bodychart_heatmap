import 'package:example/views/bodychart.dart';
import 'package:example/views/bodyheatmap.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(children: [BodyChartExample(), BodyHeatmapExample()]),
      ),
    );
  }
}
