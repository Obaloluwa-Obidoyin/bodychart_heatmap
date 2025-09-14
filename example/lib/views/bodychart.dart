import 'package:bodychart_heatmap/bodychart_heatmap.dart';
import 'package:flutter/material.dart';

class BodyChartExample extends StatefulWidget {
  const BodyChartExample({super.key});

  @override
  State<BodyChartExample> createState() => _BodyChartExampleState();
}

class _BodyChartExampleState extends State<BodyChartExample> {
  Set<String> selectedFocusAreas = {};

  final List<String> allFocusAreas = [
    'full body',
    'chest',
    'arm',
    'leg',
    'back',
    'butt',
    'shoulder',
    'abs',
    'neck',
  ];

  void addFocusArea(String area) {
    setState(() {
      if (area == 'full body') {
        selectedFocusAreas.length == allFocusAreas.length
            ? selectedFocusAreas.clear()
            : selectedFocusAreas = Set.from(allFocusAreas);
      } else {
        selectedFocusAreas.contains(area)
            ? selectedFocusAreas.remove(area)
            : selectedFocusAreas.add(area);
      }
    });
  }

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
            selectedParts: selectedFocusAreas,
            selectedColor: Colors.blueAccent,
            unselectedColor: Color(0xFFCCCCCC),
            width: 350,
            viewType: BodyViewType.both,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (var part in [
                    "Neck",
                    "Shoulder",
                    "Arm",
                    "Chest",
                    "Abs",
                    "Leg",
                    "Back",
                    "Butt",
                    "Full Body",
                  ])
                    ChoiceChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color:
                              selectedFocusAreas.contains(part.toLowerCase())
                                  ? Colors.lime[400]!
                                  : Colors.transparent,
                        ),
                      ),
                      backgroundColor: Color(0xffcccccc),
                      showCheckmark: false,
                      label: Text(
                        part,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      selected: selectedFocusAreas.contains(part.toLowerCase()),
                      onSelected: (_) => addFocusArea(part.toLowerCase()),
                      selectedColor: Colors.blueAccent,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
