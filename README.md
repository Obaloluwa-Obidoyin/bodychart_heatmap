# bodychart_heatmap

An interactive Flutter package for visualizing and highlighting body parts.  
It provides two main widgets: **`BodyHeatmap`** (for intensity visualization) and **`BodyChart`** (for selected parts highlighting).

---

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
     "neck": 1,
     "shoulder": 2,
     "chest": 3,
   },
   baseColor: Colors.green,
   unselectedColor: Colors.grey.shade300,
   width: 300,
   showToolTip: true,
   toolTipTextStyle: TextStyle(fontSize: 14, color: Colors.black),
 )
```

### BodyHeatmap Parameters


| Property            | Type              | Default                         | Description |
|---------------------|-------------------|---------------------------------|-------------|
| `selectedParts`     | `Map<String,int>` | **Required** | Body parts with intensity values (`1` = low, `2` = medium, `3` = high). |
| `baseColor`         | `Color`           | **Required**                   | Main color used for highlighting. |
| `unselectedColor`   | `Color`           | `Color(0xFFCCCCCC)`             | Color for unselected parts. |
| `width`             | `double`          | `300`                           | Custom width of the body heatmap widget |
| `showToolTip`       | `bool`            | `true`                          | Whether to show the legend/tooltip. |
| `toolTipTextStyle`  | `TextStyle`       | `TextStyle(fontSize:14,color:Colors.black)` | Style for tooltip labels. |


---

### BodyChart

```dart
import 'package:bodychart_heatmap/bodychart_heatmap.dart';

BodyChart(
  selectedParts: {"chest", "arm", "abs"},
  selectedColor: Colors.green,
  unselectedColor: Colors.grey.shade300,
  view: BodyViewType.both,
  width: 250,
)
```

| Parameter         | Type             | Default            | Description |
|-------------------|-----------------|--------------------|-------------|
| selectedParts     | Set<String>     | **required**       | The set of body parts to highlight. |
| selectedColor     | Color           | Color(0xFFBCF246)  | Color used for highlighted/selected body parts. |
| unselectedColor   | Color           | Color(0xFFCCCCCC)  | Color used for unselected body parts. |
| view              | BodyViewType    | BodyViewType.both  | Body view type: front, back, or both. |
| width             | double          | 250                | Custom width of the body chart widget. |

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
