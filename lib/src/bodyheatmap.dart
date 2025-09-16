import 'package:bodychart_heatmap/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BodyHeatmap extends StatelessWidget {
  final Map<String, int> selectedParts;
  final Color unselectedColor;
  final Color baseColor;
  final double width;
  final bool showLegend;
  final TextStyle legendTextStyle;
  final MainAxisAlignment legendAlignment;
  final int intensityLevels;

  /// Usage Example:
  /// ```dart
  /// BodyHeatmap(
  ///      selectedParts: {
  ///          "chest": 5,
  ///          "back": 4,
  ///      "arm": 10,
  ///          "leg": 5,
  ///           "butt": 10,
  ///           "shoulder": 0,
  ///           "neck": 2,
  ///           "abs": 8,
  ///         },
  ///         baseColor: Colors.blueAccent,
  ///         unselectedColor: Color(0xFFCCCCCC),
  ///         width: 350,
  ///         showLegend: true,
  ///         legendTextStyle: TextStyle(fontSize: 14, color: Colors.black),
  ///         legendAlignment: MainAxisAlignment.end,
  ///         intensityLevels: 3,
  ///       ),
  /// ```

  const BodyHeatmap({
    super.key,
    required this.selectedParts,
    required this.baseColor,
    this.unselectedColor = const Color(0xFFCCCCCC),
    this.width = 300,
    this.showLegend = true,
    this.legendTextStyle = const TextStyle(fontSize: 14, color: Colors.black),
    this.legendAlignment = MainAxisAlignment.center,
    this.intensityLevels = 3,
  });

  //Default color
  String defaultColor() {
    return unselectedColor.toHex(leadingHashSign: true);
  }

  //
  //
  // Color that fills the chart
  String fillSvg(String part) {
    final value = selectedParts[part];
    if (value == null || value == 0) {
      return unselectedColor.toHex(leadingHashSign: true);
    }

    return baseColor.toHex(leadingHashSign: true);
  }

  //
  //
  // This fills & controls the intensity!.
  double fillOpacity(String part) {
    final value = selectedParts[part];
    if (value == null || value == 0) return 1.0;

    final allValues = selectedParts.values.where((v) => v > 0);
    if (allValues.isEmpty) return 1.0;

    final min = allValues.reduce((a, b) => a < b ? a : b);
    final max = allValues.reduce((a, b) => a > b ? a : b);
    final normalized = max == min ? 1.0 : (value - min) / (max - min);

    final steps = List.generate(
      intensityLevels,
      (i) => (i + 1) / intensityLevels,
    );

    final index = (normalized * (steps.length - 1)).round();
    return steps[index];
  }

  //
  //
  //Legend Widget
  List<Widget> buildLegend() {
    const totalWidth = 80.0;
    const height = 15.0;

    final boxWidth = totalWidth / intensityLevels;

    return List.generate(intensityLevels, (i) {
      final opacity = (i + 1) / intensityLevels;
      return Container(
        height: height,
        width: boxWidth,
        color: baseColor.withOpacity(opacity),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 30,
      children: [
        SvgPicture.string(data(), width: width),
        if (showLegend)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: legendAlignment,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Text('Low', style: legendTextStyle),
                    Row(children: buildLegend()),
                    Text('High', style: legendTextStyle),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }

  String data() {
    return ''' 
//🫡
<svg width="319" height="295" viewBox="0 0 319 295" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M69 0L63 4V14H60.5V19.5C61.3333 20 63 21.2 63 22V30L69 34H79L84.5 30V22L87.5 19.5V14H84.5V4L79 0H69Z" fill="${defaultColor()}"/>
<path d="M84.5 39.5V34L78 39.5V47H95.5L84.5 39.5Z" fill="${fillSvg("neck")}" fill-opacity="${fillOpacity("neck")}"/>
<path d="M65 40.5V35L67 34L71 39.5L71.5 47H54L65 40.5Z" fill="${fillSvg("neck")}" fill-opacity="${fillOpacity("neck")}"/>
<path d="M71 73.5V55L57.5 50L51.5 63L47.5 67.5L61.5 75L71 73.5Z" fill="${fillSvg("chest")}" fill-opacity="${fillOpacity("chest")}"/>
<path d="M77 54L86.5 50H92.5L98.5 64L102 66V68L85.5 75L77 73.5V54Z" fill="${fillSvg("chest")}" fill-opacity="${fillOpacity("chest")}"/>
<path d="M100 62.5L95.5 51L100.5 51.5L109 63.5V68L100 62.5Z" fill="${fillSvg("shoulder")}" fill-opacity="${fillOpacity("shoulder")}"/>
<path d="M113.5 57.5L109 51H102.5L109 60L111.5 66.5H113.5V57.5Z" fill="${fillSvg("shoulder")}" fill-opacity="${fillOpacity("shoulder")}" />
<path d="M48.5 62.5L53.5 51C51.8333 51 48.5 51.1 48.5 51.5C48.5 51.9 43.1667 59 40.5 62.5V67L48.5 62.5Z" fill="${fillSvg("shoulder")}" fill-opacity="${fillOpacity("shoulder")}"/>
<path d="M36.5 57V67L47 51H40.5L36.5 57Z" fill="${fillSvg("shoulder")}" fill-opacity="${fillOpacity("shoulder")}"/>
<path id="arm" d="M110 70H101.5L102.5 81.5L105 87L111.5 93.5H115V87L110 70Z" 
fill="${fillSvg("arm")}" fill-opacity="${fillOpacity("arm")}"/>
<path id="arm" d="M119 79.5L115 74L115.5 93.5L117 94.5L120 91.5L119 79.5Z" fill="${fillSvg("arm")}" fill-opacity="${fillOpacity("arm")}"/>
<path id="arm" d="M114 103L107 98L106.506 93.5509L115.5 101V103H114Z" fill="${fillSvg("arm")}" fill-opacity="${fillOpacity("arm")}"/>
<path id="arm" d="M121 96H117.5V107L132.5 132L135 131L126.5 118V110L121 96Z" fill="${fillSvg("arm")}" fill-opacity="${fillOpacity("arm")}"/>
<path id="arm" d="M115 120.5L108 101L116 106.5L129.5 131L128 135L115 120.5Z" fill="${fillSvg("arm")}" fill-opacity="${fillOpacity("arm")}" />
<path id="arm" d="M38 70H47L46 81.5L44 87L38 93.5509H34V96L30.5 92.5V81L34 74.5V87L38 70Z" fill="${fillSvg("arm")}" fill-opacity="${fillOpacity("arm")}"/>
<path id="arm" d="M42 98V93.5509L34 101L35.5 103L42 98Z" fill="${fillSvg("arm")}" fill-opacity="${fillOpacity("arm")}"/>
<path id="arm" d="M30.5 105V96H27L21 118L14.5 131L17 132L30.5 105Z" fill="${fillSvg("arm")}" fill-opacity="${fillOpacity("arm")}"/>
<path id="arm" d="M19.5 132L23 135L35.5 118L42 101L34 105L19.5 132Z" 
fill="${fillSvg("arm")}" fill-opacity="${fillOpacity("arm")}"/> 
<path d="M50 75.5V72L52 75.5H50Z" fill="${fillSvg("abs")}" fill-opacity="${fillOpacity("abs")}"/>
<path d="M60 77L55.5 75.5L54.5 78L60 79.5V77Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M57 92L49.5 82.5V78.5L51.5 78L52 80L57.5 86.5L57 92Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M52.5 79.5V78L59 81L58 86L52.5 79.5Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M49.5 93.5V86.5L57.5 96V101H55.5L49.5 93.5Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M59.5 105L53 102.5L52 120.5L62 127.5V125L60.5 121.5L59.5 105Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M96 102.5L89.5 106L89 121L87.5 125V127.5H89.5L97.5 121.5L96 102.5Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M92.5 101V95L96 92L100.5 86.5L99 95L92.5 101Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M93 92.5L92.5 86.5L97.5 81V78L100.5 78.5V82.5L93 92.5Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M96 78L90.5 81.5V86L92 85.5L96 81.5V78Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M93 75.5L89.5 78L95.5 77.5L96 75.5H93Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M100.5 75.5L97.5 72V76L100.5 75.5Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M69 78.5L60.5 82.5L61 87.5H63.5L68.5 84L72 83.5V78L69 78.5Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M77.5 84V78.5H82V79L88 81.5V87.5H86L82.5 84H77.5Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M72 96V88.5L62 92V97.5L65 96H72Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M77.5 96V88.5L87.5 91V97.5L84.5 96H77.5Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M62 107V101L72 100.5V110L69 109L62 107Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M78 110L77.5 101H87.5V108L81.5 109L78 110Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M70.5 112L62 111L66 134L72 136L70.5 112Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M86 112H77.5L76.5 136L82.5 134L86 112Z" fill="${fillSvg("abs")}"  fill-opacity="${fillOpacity("abs")}"/>
<path d="M49.5 123.5L52.5 126L51 164.5L60 199L54.5 164.5V143.5L64.5 166L63.5 198L60 199H57.5L47.5 166L49.5 123.5Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M96 127L99 123.5L100.5 166L91.5 199H88.5H86L82.1556 169.206L82 168L80.5 162L93.5 131.5V142.5L82 168L82.1556 169.206L96 142.5L95 166L88.5 199L97.5 166L96 127Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M56 142.5V131.5L60 142.5L68 162V168L56 142.5Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M73.5 189L68 171.5L65.5 200L69.5 201.5L73.5 189Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M76.5 189L80.5 171.5L82.1556 200L78.5 201.5L76.5 189Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M63.5 229.5L57.5 216.5L53.5 238.5L63.5 270.5L68 272.5L63.5 254V229.5Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M68 261V224L72.5 229.5L71 246L69.5 266.5L68 261Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M78.5 242.5V224L82.1556 231.5L83 248.5L80 266.5V247L78.5 242.5Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M86 226.5L91.5 216.5L95 238.5L86 269.5L83 272.5L80 270.5L86 248.5V226.5Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M15.5 138L13.5 134.5L7 135L0 141.5L4 142L6 139.5L7 142L1 153L4 154L7 147L8.5 147.5L5.5 156H9L11 148L13 149L10.5 156L13.5 156.5L15.5 149H17L16.5 156.5L19 155.5L20 147.5L21 147L20.5 138H15.5Z" fill="${defaultColor()}"/>
<path d="M130.5 156.5L129 149.5V137.5H134V134H139L148.5 140V142H145L141.5 140L141 142.5L147.5 154L144.5 154.5L141.5 149L140.5 149.5L143.5 155.5L140 156L137.5 150H135.5L137.5 156H135L132.5 150L131.5 150.5L132.5 155.5L130.5 156.5Z" fill="${defaultColor()}"/>
<path d="M65 150L58 130.5L70.5 143L65 150Z" fill="${defaultColor()}"/>
<path d="M90 130.5L79 143L83.5 150L91.5 132L90 130.5Z" fill="${defaultColor()}"/>
<path d="M77 157V146L81.5 151L79 160.5L77 157Z" fill="${defaultColor()}"/>
<path d="M68 152L72 146L73 157L69.5 160.5L68 152Z" fill="${defaultColor()}"/>
<path d="M54.5 211.5V202.5L59.5 212L54.5 211.5Z" fill="${defaultColor()}"/>
<path d="M59.5 209.5V205L67.5 206L63 216.5L59.5 209.5Z" fill="${defaultColor()}"/>
<path d="M65.5 216.5L70.5 206L72 213.5L68.5 222L65.5 222.5V216.5Z" fill="${defaultColor()}"/>
<path d="M76.5 213.5V205L83.5 216.5L82.5 223.5L80 222.5L76.5 213.5Z" fill="${defaultColor()}"/>
<path d="M84.5 214.5L82.5 205H90L87.5 211.5L86.5 216.5H84.5V214.5Z" fill="${defaultColor()}"/>
<path d="M89.5 211.5L94 201.5V211.5H89.5Z" fill="${defaultColor()}"/>
<path d="M71.5 291V276L63 277.5L58 288.5L65 291H67.5L68.5 287.5V291H71.5Z" fill="${defaultColor()}"/>
<path d="M77 291V274.5L83 276L91 285.5L89.5 290H84.5V292L77 291Z" fill="${defaultColor()}"/>
//🤞
<path d="M229 20L230.5 28L234 24.5V20H245V24.5V28L250 26.5V18L252.5 14L250 13V4L243 0H234L227.5 7V11L225.5 14L229 20Z" fill="${defaultColor()}"/>
<path d="M177.5 141L176.5 137.5L167 141.5L163.5 145.5L164.5 146.5L167.5 144.5L170.5 145.5L164.5 157.5H167.5L170.5 150.5L172 151.5L168.5 160H172L174.5 151.5H177.5L174.5 160H176.5L180 152.5V159H181.5L182.5 152.5V141H177.5Z" fill="${defaultColor()}"/>
<path d="M299.5 141H294.5V150.5L296 159.5H298.5L297.5 151.5L299.5 153L301 160H303.5L301 153H303L305.5 160L309.5 159.5L305 151.5H307L310.5 157.5H312.5L306 144.5L308 143.5L312.5 146.5L314 145V143.5L305 137.5H301L299.5 141Z" fill="${defaultColor()}"/>
<path d="M224.5 271.5L222 260.5V276.5L223 288.5H225L224.5 271.5Z" fill="${defaultColor()}"/>
<path d="M253 271.5L256.5 260.5V279L255 288.5H253V271.5Z" fill="${defaultColor()}"/>
<path d="M220 287L217.5 288.5L223 294.5H226L232 293V289.5H230L228 291.5L223.5 290.5L220 287Z" fill="${defaultColor()}"/>
<path d="M246 293V288.5L250.5 290.5H255L258.5 288.5L257.5 291.5L255 294.5H253L246 293Z" fill="${defaultColor()}"/>
<path d="M221 116H216L217.37 105.5L221 116Z" fill="${defaultColor()}"/>
<path d="M257.5 116L261 104.5L262.5 118.5L257.5 116Z" fill="${defaultColor()}"/>
<path d="M228 153.5L223.5 156.5V165.5L221.5 171.5V183.5L223.5 197.5L229.5 211L232 206L231 184.5L228 176V153.5Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M236 149.5L231 151.5L232 179H234L235 172.5L236 168V149.5Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M242 167V149.5L246.5 151.5L247.5 176L245 178L242 167Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M250 176L248.5 153.5L253.5 154.5L254.5 159L256.5 168V183.5L253.5 198.5L251.5 203L250 208L248.5 211L246.5 207H245L246.5 187.5L250 176Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M259.5 183.5L258.5 160L263.5 167L266.5 183.5L262 191.5V203H259.5L257.5 191.5L259.5 183.5Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M265 155.5L263.5 159V162L264 166.5L266 168.5L267.5 155.5H265Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M212 169V155.5L215.5 160.5L214 167L212 169Z" fill="${fillSvg("leg")}" fill-opacity="${fillOpacity("leg")}"/>
<path d="M214 174L217 161.5H220.5L219 170.5L217.5 184.5L220.5 191L219 197.5L217.5 203.5L215.5 203V192.5L212.5 184L214 174Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M222.5 203H219.5L217 214.5L215.5 235.5L221.5 246.5L223.5 242.5L221.5 235.5L222.5 203Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M225.5 242.5V208L232 223.5L234 232.5V246.5L232 249L225.5 242.5Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M245 223.5L254.5 208L253.5 242L245 249L244 242L245 223.5Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M256.5 239.5V203.5L262 216V226V239.5L258.5 246.5L254.5 245L256.5 239.5Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M225 246L222.5 248V254.5L225.5 265.5L226.5 288H229.5L232 252.5L225 246Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M253 247.5L246.5 252.5L249.246 288H251.5V270L256.5 248L253 247.5Z" fill="${fillSvg("leg")}"  fill-opacity="${fillOpacity("leg")}"/>
<path d="M254.5 118L251 122.5L258 125.5L263.5 133.5L264.5 131L262 121L254.5 118Z" fill="${fillSvg("butt")}"  fill-opacity="${fillOpacity("butt")}"/>
<path d="M227 122.5L223 118L216 121.5L213.5 133.5L215.5 132.5L220.5 125.5L227 122.5Z" fill="${fillSvg("butt")}"  fill-opacity="${fillOpacity("butt")}"/>
<path d="M231 129L230 125.5L219 131L213.5 139V151.5L217.5 158L237.5 144.5L236.5 133.5L231 129Z" fill="${fillSvg("butt")}"  fill-opacity="${fillOpacity("butt")}"/>
<path d="M240.5 144.5L242 132.5L249 126.5L258 129L264.5 140V152.5L262 156.5L260 158L258 154L251 151.5L240.5 144.5Z" fill="${fillSvg("butt")}"  fill-opacity="${fillOpacity("butt")}"/>
<path d="M213.5 51.5L204.5 50.5L196.5 63.5H198.5L200 67.5L213.5 51.5Z" fill="${fillSvg("shoulder")}"  fill-opacity="${fillOpacity("shoulder")}"/>
<path d="M264 53.5L278.5 67.5L280 60L275 51.5L267.5 50.5L264 53.5Z" fill="${fillSvg("shoulder")}"  fill-opacity="${fillOpacity("shoulder")}"/>
<path d="M270 87L272 67.5L282 77V95L278.5 96.5L275 98V95L270 87Z" fill="${fillSvg("arm")}"  fill-opacity="${fillOpacity("arm")}"/>
<path d="M283 104L279.5 99L278.5 104L274.5 103.5L279.5 118L288.5 127L283 115.5V104Z" fill="${fillSvg("arm")}"  fill-opacity="${fillOpacity("arm")}"/>
<path d="M285.5 118V101.5L290.5 103.5C292 110.5 295.1 124.7 295.5 125.5C295.9 126.3 298.333 130.5 299.5 132.5L298 135.5L296.5 138L285.5 118Z" fill="${fillSvg("arm")}"  fill-opacity="${fillOpacity("arm")}"/>
<path d="M207 87L205.5 67.5L195 78L194 95L201.5 96.5L207 87Z" fill="${fillSvg("arm")}"  fill-opacity="${fillOpacity("arm")}"/>
<path d="M200 103.5V99L195 101.5L194 115.5L189.5 127H192L200 115.5L203 103.5H200Z" fill="${fillSvg("arm")}"  fill-opacity="${fillOpacity("arm")}"/>
<path d="M183 125.5L189.5 101.5H194L192 115.5L187 128.5L182 136.5L178 132.5L183 125.5Z" fill="${fillSvg("arm")}"  fill-opacity="${fillOpacity("arm")}"/>
<path d="M238.5 22.5H236L235 30.5L219 45H226L236 47L237 33L238.5 30.5V22.5Z" fill="${fillSvg("neck")}"  fill-opacity="${fillOpacity("neck")}"/>
<path d="M241.5 22.5H240V33L241.5 33.5L243 47.5L248.5 45L257 43.5L243.5 33.5L243 30.5L241.5 22.5Z" fill="${fillSvg("neck")}"  fill-opacity="${fillOpacity("neck")}"/>
<path d="M220 47H212L219 52L225 67L236 75.5L235 52L220 47Z" fill="${fillSvg("back")}"  fill-opacity="${fillOpacity("back")}"/>
<path d="M258 47L243 52V75.5L252 67L258 51L266 47H258Z" fill="${fillSvg("back")}"  fill-opacity="${fillOpacity("back")}"/>
<path d="M265 55.5H260L255.5 68.5L269.5 67V61L265 55.5Z" fill="${fillSvg("back")}"  fill-opacity="${fillOpacity("back")}"/>
<path d="M222.5 67L217.5 55.5H213L209 61V67H222.5Z" fill="${fillSvg("back")}"  fill-opacity="${fillOpacity("back")}"/>
<path d="M222.5 73L209 71L222.5 114.5L237 125.5L235 83L222.5 73Z" fill="${fillSvg("back")}"  fill-opacity="${fillOpacity("back")}"/>
<path d="M255.5 73L243 83L241.5 125.5L255.5 114.5L268.5 70L255.5 73Z" fill="${fillSvg("back")}"  fill-opacity="${fillOpacity("back")}"/>
</svg>
    ''';
  }
}
