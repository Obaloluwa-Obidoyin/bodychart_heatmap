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
            "chest": 1,
            "back": 3,
            "arm": 2,
            "leg": 3,
            "butt": 0,
            "shoulder": 0,
            "neck": 0,
            "abs": 0,
          },
          baseColor: Colors.blueAccent,
          unselectedColor: Color(0xFFCCCCCC),
          width: 350,
          showToolTip: true,
          toolTipTextStyle: TextStyle(fontSize: 14, color: Colors.black),
          toolTipAlignment: MainAxisAlignment.end,
        ),
      ],
    );
  }
}
