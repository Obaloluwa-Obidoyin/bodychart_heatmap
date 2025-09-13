# BodyChart Heatmap 🧍🔥  

A Flutter package that provides an **interactive SVG-based body heatmap chart** for fitness, medical, or tracking applications.  
Easily highlight different body parts (neck, shoulders, chest, arms, abs, legs, butt, back) with **intensity levels** and display a color-coded tooltip legend.  

---

## ✨ Features
- 📊 Heatmap visualization of body parts
- 🎨 Customizable colors (`baseColor`, `unselectedColor`)  
- 🔢 Supports **3 intensity levels** per body part (low, medium, high)  
- 🖼️ Vector-based (SVG) for crisp rendering on all screen sizes  
- 🛠️ Tooltip legend with configurable text style  
- 📱 Works out of the box with Flutter widgets  

---

## 🚀 Installation  

## Add it to your package's pubspec.yaml file

```dart
  flutter pub add flutter_heatmap_calendar
```

or

```yaml
dependencies:
  bodychart_heatmap: ^1.0.0
```

Run

```sh
flutter pub get
```

---

# Parameters
---

## BodyChart
---

| Parameter         | Type             | Default            | Description |
|-------------------|-----------------|--------------------|-------------|
| `selectedParts`   | `Set<String>`   | **required**       | The set of body parts to highlight. |
| `selectedColor`   | `Color`         | `Color(0xFFBCF246)`| Color used for highlighted/selected body parts. |
| `unselectedColor` | `Color`         | `Color(0xFFCCCCCC)`| Color used for unselected body parts. |
| `view`            | `BodyViewType`  | `BodyViewType.both`| Body view type: `front`, `back`, or `both`. |
| `width`           | `double`        | `250`              | Custom width of the body chart widget. |

## BodyHeatmap
---

| Property            | Type              | Default                         | Description |
|---------------------|-------------------|---------------------------------|-------------|
| `selectedParts`     | `Map<String,int>` | **Required** | Body parts with intensity values (`1` = low, `2` = medium, `3` = high). |
| `baseColor`         | `Color`           | **Required**                   | Main color used for highlighting. |
| `unselectedColor`   | `Color`           | `Color(0xFFCCCCCC)`             | Color for unselected parts. |
| `width`             | `double`          | `300`                           | Width of the SVG chart. |
| `showToolTip`       | `bool`            | `true`                          | Whether to show the legend/tooltip. |
| `toolTipTextStyle`  | `TextStyle`       | `TextStyle(fontSize:14,color:Colors.black)` | Style for tooltip labels. |

# Example

## BodyChart

```dart
BodyChart(
  selectedParts: {"chest", "arm", "abs"},
  selectedColor: Colors.green,
  unselectedColor: Colors.grey.shade300,
  view: BodyViewType.front,
  width: 300,
)
```

## BodyHeapmap

```dart
BodyHeatmap(
  selectedParts: {
  "neck": 1,
  "shoulder": 2,
  "chest": 3,
  },
  baseColor: Colors.red,
  unselectedColor: Colors.grey.shade300,
  width: 300,
  showToolTip: true,
  toolTipTextStyle: TextStyle(fontSize: 14, color: Colors.black),
 )
```

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
---