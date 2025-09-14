import 'package:bodychart_heatmap/bodychart_heatmap.dart';
import 'package:flutter/material.dart';

class BodyChartExample extends StatefulWidget {
  const BodyChartExample({super.key});

  @override
  State<BodyChartExample> createState() => _BodyChartExampleState();
}

class _BodyChartExampleState extends State<BodyChartExample> {
  Set<String> selectedPart = {};
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          // BodyChart(
          //   selectedParts: {"full body"},
          //   selectedColor: Colors.blueAccent,
          //   unselectedColor: Color(0xFFCCCCCC),
          //   width: 170,
          //   viewType: BodyViewType.front,
          // ),
          // SizedBox(height: 30),
          // BodyChart(
          //   selectedParts: {"full body"},
          //   selectedColor: Colors.blueAccent,
          //   unselectedColor: Color(0xFFCCCCCC),
          //   width: 170,
          //   viewType: BodyViewType.back,
          // ),
          // SizedBox(height: 30),
          BodyChart(
            selectedParts: selectedPart,
            selectedColor: Colors.blueAccent,
            unselectedColor: Color(0xFFCCCCCC),
            width: 300,
            viewType: BodyViewType.both,
          ),
        ],
      ),
    );
  }
}
