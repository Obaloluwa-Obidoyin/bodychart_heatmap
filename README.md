## bodychart_heatmap

An interactive Flutter package for visualizing and highlighting body parts for fitness, medical, or tracking applications.

It provides two main widgets: **`BodyHeatmap`** (for intensity visualization) and **`BodyChart`** (for selected parts highlighting).

## Preview

![bodyheatmap](https://github.com/user-attachments/assets/e0bfdad0-0ab6-4fb7-abc3-e71b01f3c4f7)
![bodychart](https://github.com/user-attachments/assets/26fd5eef-d5c9-4b8d-a573-5c253ab5594d)

## Installation

Add the dependency in your `pubspec.yaml`:

```yaml
dependencies:
  bodychart_heatmap: ^1.0.0
```

or run:

```dart
flutter pub add bodychart_heatmap
```

Then run:

```dart
flutter pub get
```

## Usage

### BodyHeatmap

```dart
import 'package:bodychart_heatmap/bodychart_heatmap.dart';

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
  unselectedColor: const Color(0xFFCCCCCC),
  width: 350,
  showLegend: true,
  legendTextStyle: const TextStyle(fontSize: 14, color: Colors.black),
  legendAlignment: MainAxisAlignment.end,
  intensityLevels: 3,
)

```

### BodyHeatmap Parameters

| Property          | Type                | Default                           | Description |
|-------------------|---------------------|-----------------------------------|-------------|
| `selectedParts`   | `Map<String,int>`   | **Required**                      | Body parts with intensity values. `0` = unselected (uses `unselectedColor`). Higher values map across the `intensityLevels`. |
| `baseColor`       | `Color`             | **Required**                      | Main color used for highlighting. |
| `unselectedColor` | `Color`             | `Color(0xFFCCCCCC)`               | Color for unselected / 0-value parts. |
| `width`           | `double`            | `300`                             | Custom width of the heatmap widget. |
| `showLegend`      | `bool`              | `true`                            | Whether to display the legend under the heatmap. |
| `legendTextStyle` | `TextStyle`         | `TextStyle(fontSize:14,color:Colors.black)` | Style for legend labels. |
| `legendAlignment` | `MainAxisAlignment` | `MainAxisAlignment.center`        | Alignment of the legend row (`.start`, `.center`, `.end`). |
| `intensityLevels` | `int`               | `3`                               | Number of intensity levels (e.g. `3` for Low/Medium/High, `4` for GitHub-style). |

### BodyChart

```dart
import 'package:bodychart_heatmap/bodychart_heatmap.dart';

BodyChart(
  selectedParts: {"chest", "arm", "abs","back","butt"},
  selectedColor: Colors.green,
  unselectedColor: Colors.grey.shade300,
  viewType: BodyViewType.both,
  width: 250,
)
```

### BodyChart Parameters

| Parameter       | Type          | Default            | Description |
|-----------------|--------------|--------------------|-------------|
| `selectedParts`   | `Set<String>`  | **required**       | The set of body parts to highlight. <br> • **front**: `{"neck","shoulder","chest","arm","abs","leg","full body"}` <br> • **back**: `{"neck","back","shoulder","arm","butt","leg","full body"}` <br> • **both**: `{"neck","shoulder","chest","arm","abs","leg","butt","back","full body"}` |
| `selectedColor`   | `Color`        | `Color(0xFFBCF246)`  | Color used for highlighted/selected body parts. |
| `unselectedColor` | `Color`        | `Color(0xFFCCCCCC)`  | Color used for unselected body parts. |
| `viewType`        | `BodyViewType` |`BodyViewType.both`  | Body view type: `front`, `back`, or `both`. |
| `width`          | `double`       | `250`              | Custom width of the body chart widget. |
