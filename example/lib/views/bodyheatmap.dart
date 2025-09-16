import 'package:bodychart_heatmap/bodychart_heatmap.dart';
import 'package:flutter/material.dart';

class BodyHeatmapExample extends StatelessWidget {
  const BodyHeatmapExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BodyHeatmap(
          selectedParts: {
            "chest": 5,
            "back": 4,
            "arm": 10,
            "leg": 5,
            "butt": 10,
            "shoulder": 0,
            "neck": 2,
            "abs": 8,
          },
          baseColor: Colors.blueAccent,
          unselectedColor: Color(0xFFCCCCCC),
          width: 350,
          showLegend: true,
          legendTextStyle: TextStyle(fontSize: 14, color: Colors.black),
          legendAlignment: MainAxisAlignment.end,
          intensityLevels: 3,
        ),
      ],
    );
  }
}
