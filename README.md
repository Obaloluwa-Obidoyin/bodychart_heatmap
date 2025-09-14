# bodychart_heatmap

An interactive Flutter package for visualizing and highlighting body parts for fitness, medical, or tracking applications.

It provides two main widgets: **`BodyHeatmap`** (for intensity visualization) and **`BodyChart`** (for selected parts highlighting).

---

## Preview

[bodychart](https://github.com/user-attachments/assets/3175267c-047c-4064-b385-27d9003d0498)
[bodyheatmap]<img width="1080" height="2400" alt="Screenshot_1757880970" src="https://github.com/user-attachments/assets/bd82ac6b-4731-4d2c-96d8-9de5a18d96bd" />

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
    "chest": 1,
    "back": 3,
    "arm": 2,
    "leg": 3,
    "butt": 1,
    "shoulder": 0, 
    "neck": 1,
    "abs": 1,
  },
  baseColor: Colors.blueAccent,
  unselectedColor: const Color(0xFFCCCCCC),
  width: 350,
  showToolTip: true,
  toolTipTextStyle: const TextStyle(fontSize: 14, color: Colors.black),
  toolTipAlignment: MainAxisAlignment.end,
)

```

### BodyHeatmap Parameters

| Property            | Type                | Default                           | Description |
|---------------------|---------------------|-----------------------------------|-------------|
| `selectedParts`     | `Map<String,int>`   | **Required**                      | Body parts with intensity values:<br/>`0` = unselected (uses `unselectedColor`),<br/>`1` = low, `2` = medium, `3` = high. |
| `baseColor`         | `Color`             | **Required**                      | Main color used for highlighting. |
| `unselectedColor`   | `Color`             | `Color(0xFFCCCCCC)`               | Color for unselected/0-value parts. |
| `width`             | `double`            | `300`                             | Custom width of the heatmap widget. |
| `showToolTip`       | `bool`              | `true`                            | Whether to show the legend/tooltip. |
| `toolTipTextStyle`  | `TextStyle`         | `TextStyle(fontSize:14,color:Colors.black)` | Style for tooltip labels. |
| `toolTipAlignment`  | `MainAxisAlignment` | `MainAxisAlignment.center`        | Alignment of the tooltip row (`.start`, `.center`, `.end`). |

---

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

---

## License

```
MIT License

Copyright (c) 2025 Obaloluwa Obidoyin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
