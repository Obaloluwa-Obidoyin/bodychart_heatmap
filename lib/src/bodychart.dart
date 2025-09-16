import 'package:bodychart_heatmap/src/utils/util.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

enum BodyViewType { front, back, both }

class BodyChart extends StatelessWidget {
  final Set<String> selectedParts;
  final Color unselectedColor;
  final Color selectedColor;
  final double width;
  final BodyViewType viewType;

  /// Usage Example:
  ///
  /// [Both]
  /// ```dart
  /// BodyChart(
  /// selectedParts: {"neck","shoulder","chest","arm","abs","leg",
  /// "butt", "back", "full body"},
  /// selectedColor: Colors.blueAccent,
  /// unselectedColor: Color(0xFFCCCCCC),
  /// width: 350,
  /// viewType: BodyViewType.both,
  ///  ),
  /// ```
  /// [front]
  /// ```dart
  /// BodyChart(
  ///   selectedParts: {"neck","shoulder","chest","arm","abs","leg","full body"},
  ///   selectedColor: Colors.blueAccent,
  ///   unselectedColor: Color(0xFFCCCCCC),
  ///   width: 170,
  ///   viewType: BodyViewType.front,
  /// ),
  /// ```
  /// [back]
  /// ```dart
  /// BodyChart(
  ///   selectedParts: {"neck","back","shoulder","arm","butt","leg","full body"},
  ///   selectedColor: Colors.blueAccent,
  ///   unselectedColor: Color(0xFFCCCCCC),
  ///   width: 170,
  ///   viewType: BodyViewType.back,
  /// ),
  /// ```

  const BodyChart({
    super.key,
    required this.selectedParts,
    this.selectedColor = const Color(0xFFBCF246),
    this.unselectedColor = const Color(0xFFCCCCCC),
    this.viewType = BodyViewType.both,
    this.width = 250,
  });

  //
  //
  //This fills the chart color
  String fillSvg(String part) {
    return selectedParts.contains(part) || selectedParts.contains("full body")
        ? selectedColor.toHex(leadingHashSign: true)
        : unselectedColor.toHex(leadingHashSign: true);
  }

  //
  //
  // Default color
  String defaultColor() {
    return unselectedColor.toHex(leadingHashSign: true);
  }

  @override
  Widget build(BuildContext context) {
    final data = buildSvg(viewType);
    return SvgPicture.string(data, width: width);
  }

  //Front view only chart!
  String frontSvg() {
    return '''
<svg width="149" height="292" viewBox="0 0 149 292" fill="none" xmlns="http://www.w3.org/2000/svg">

<path d="M69 0L63 4V14H60.5V19.5C61.3333 20 63 21.2 63 22V30L69 
34H79L84.5 30V22L87.5 19.5V14H84.5V4L79 0H69Z" fill="${defaultColor()}"/>
// 
<path d="M84.5 39.5V34L78 39.5V47H95.5L84.5 39.5Z" fill="${fillSvg("neck")}"/>
<path  d="M65 40.5V35L67 34L71 39.5L71.5 47H54L65 40.5Z" fill="${fillSvg("neck")}"/>
<path  d="M71 73.5V55L57.5 50L51.5 63L47.5 67.5L61.5 75L71 73.5Z" 
fill="${fillSvg("chest")}"/>
<path d="M77 54L86.5 50H92.5L98.5 64L102 66V68L85.5 75L77 73.5V54Z" fill="${fillSvg("chest")}"/>
<path  d="M100 62.5L95.5 51L100.5 51.5L109 63.5V68L100 62.5Z" fill="${fillSvg("shoulder")}"/>
<path  d="M113.5 57.5L109 51H102.5L109 60L111.5 66.5H113.5V57.5Z" fill="${fillSvg("shoulder")}"/>
<path  d="M48.5 62.5L53.5 51C51.8333 51 48.5 51.1 48.5 51.5C48.5 51.9 43.1667 59 40.5 62.5V67L48.5 62.5Z" fill="${fillSvg("shoulder")}"/>
<path  d="M36.5 57V67L47 51H40.5L36.5 57Z" fill="${fillSvg("shoulder")}"/>
<path  d="M110 70H101.5L102.5 81.5L105 87L111.5 93.5H115V87L110 70Z" 
fill="${fillSvg("arm")}"/>
<path  d="M119 79.5L115 74L115.5 93.5L117 94.5L120 91.5L119 79.5Z" fill="${fillSvg("arm")}"/>
<path  d="M114 103L107 98L106.506 93.5509L115.5 101V103H114Z" fill="${fillSvg("arm")}"/>
<path  d="M121 96H117.5V107L132.5 132L135 131L126.5 118V110L121 96Z" fill="${fillSvg("arm")}"/>
<path  d="M115 120.5L108 101L116 106.5L129.5 131L128 135L115 120.5Z" fill="${fillSvg("arm")}"/>
<path  d="M38 70H47L46 81.5L44 87L38 93.5509H34V96L30.5 92.5V81L34 74.5V87L38 70Z" fill="${fillSvg("arm")}"/>
<path  d="M42 98V93.5509L34 101L35.5 103L42 98Z" fill="${fillSvg("arm")}"/>
<path  d="M30.5 105V96H27L21 118L14.5 131L17 132L30.5 105Z" fill="${fillSvg("arm")}"/>
<path  d="M19.5 132L23 135L35.5 118L42 101L34 105L19.5 132Z" 
fill="${fillSvg("arm")}"/>
<path  d="M50 75.5V72L52 75.5H50Z" fill="${fillSvg("abs")}"/>
<path  d="M60 77L55.5 75.5L54.5 78L60 79.5V77Z" fill="${fillSvg("abs")}"/>
<path  d="M57 92L49.5 82.5V78.5L51.5 78L52 80L57.5 86.5L57 92Z" fill=""/>
<path  d="M52.5 79.5V78L59 81L58 86L52.5 79.5Z" fill="${fillSvg("abs")}"/>
<path  d="M49.5 93.5V86.5L57.5 96V101H55.5L49.5 93.5Z" fill="${fillSvg("abs")}"/>
<path  d="M59.5 105L53 102.5L52 120.5L62 127.5V125L60.5 121.5L59.5 105Z" fill="${fillSvg("abs")}"/>
<path  d="M96 102.5L89.5 106L89 121L87.5 125V127.5H89.5L97.5 121.5L96 102.5Z" fill="${fillSvg("abs")}"/>
<path  d="M92.5 101V95L96 92L100.5 86.5L99 95L92.5 101Z" fill="${fillSvg("abs")}"/>
<path  d="M93 92.5L92.5 86.5L97.5 81V78L100.5 78.5V82.5L93 92.5Z" fill="${fillSvg("abs")}"/>
<path  d="M96 78L90.5 81.5V86L92 85.5L96 81.5V78Z" fill="${fillSvg("abs")}"/>
<path  d="M93 75.5L89.5 78L95.5 77.5L96 75.5H93Z" fill="${fillSvg("abs")}"/>
<path  d="M100.5 75.5L97.5 72V76L100.5 75.5Z" fill="${fillSvg("abs")}"/>
<path  d="M69 78.5L60.5 82.5L61 87.5H63.5L68.5 84L72 83.5V78L69 78.5Z" fill="${fillSvg("abs")}"/>
<path  d="M77.5 84V78.5H82V79L88 81.5V87.5H86L82.5 84H77.5Z" fill="${fillSvg("abs")}"/>
<path  d="M72 96V88.5L62 92V97.5L65 96H72Z" fill="${fillSvg("abs")}"/>
<path  d="M77.5 96V88.5L87.5 91V97.5L84.5 96H77.5Z" fill="${fillSvg("abs")}"/>
<path  d="M62 107V101L72 100.5V110L69 109L62 107Z" fill="${fillSvg("abs")}"/>
<path  d="M78 110L77.5 101H87.5V108L81.5 109L78 110Z" fill="${fillSvg("abs")}"/>
<path  d="M70.5 112L62 111L66 134L72 136L70.5 112Z" fill="${fillSvg("abs")}"/>
<path d="M86 112H77.5L76.5 136L82.5 134L86 112Z" fill="${fillSvg("abs")}"/>
<path d="M49.5 123.5L52.5 126L51 164.5L60 199L54.5 164.5V143.5L64.5 166L63.5 198L60 199H57.5L47.5 166L49.5 123.5Z" fill="${fillSvg("leg")}"/>
<path d="M96 127L99 123.5L100.5 166L91.5 199H88.5H86L82.1556 169.206L82 168L80.5 162L93.5 131.5V142.5L82 168L82.1556 169.206L96 142.5L95 166L88.5 199L97.5 166L96 127Z" fill="${fillSvg("leg")}"/>
<path d="M56 142.5V131.5L60 142.5L68 162V168L56 142.5Z" fill="${fillSvg("leg")}"/>
<path d="M73.5 189L68 171.5L65.5 200L69.5 201.5L73.5 189Z" fill="${fillSvg("leg")}"/>
<path d="M76.5 189L80.5 171.5L82.1556 200L78.5 201.5L76.5 189Z" fill="${fillSvg("leg")}"/>
<path d="M63.5 229.5L57.5 216.5L53.5 238.5L63.5 270.5L68 272.5L63.5 254V229.5Z" fill="${fillSvg("leg")}"/>
<path d="M68 261V224L72.5 229.5L71 246L69.5 266.5L68 261Z" fill="${fillSvg("leg")}"/>
<path d="M78.5 242.5V224L82.1556 231.5L83 248.5L80 266.5V247L78.5 242.5Z" fill="${fillSvg("leg")}"/>
<path d="M86 226.5L91.5 216.5L95 238.5L86 269.5L83 272.5L80 270.5L86 248.5V226.5Z" fill="${fillSvg("leg")}"/>
<path d="M15.5 138L13.5 134.5L7 135L0 141.5L4 142L6 139.5L7 142L1 153L4 154L7 147L8.5 147.5L5.5 156H9L11 148L13 149L10.5 156L13.5 156.5L15.5 149H17L16.5 156.5L19 155.5L20 147.5L21 147L20.5 138H15.5Z" fill="${defaultColor()}"/>
<path d="M130.5 156.5L129 149.5V137.5H134V134H139L148.5 140V142H145L141.5 140L141 142.5L147.5 154L144.5 154.5L141.5 149L140.5 149.5L143.5 155.5L140 156L137.5 150H135.5L137.5 156H135L132.5 150L131.5 150.5L132.5 155.5L130.5 156.5Z" fill="${defaultColor()}"/>
<path d="M65 150L58 130.5L70.5 143L65 150Z" fill="${defaultColor()}"/>
<path d="M90 130.5L79 143L83.5 150L91.5 132L90 130.5Z" fill="${defaultColor()}"/>
<path d="M77 157V146L81.5 151L79 160.5L77 157Z" fill="${defaultColor()}"/>
<path d="M68 152L72 146L73 157L69.5 160.5L68 152Z" fill="${defaultColor()}"/>
<path d="M54.5 211.5V202.5L59.5 212L54.5 211.5Z" fill="#${defaultColor()}"/>
<path d="M59.5 209.5V205L67.5 206L63 216.5L59.5 209.5Z" fill="${defaultColor()}"/>
<path d="M65.5 216.5L70.5 206L72 213.5L68.5 222L65.5 222.5V216.5Z" fill="${defaultColor()}"/>
<path d="M76.5 213.5V205L83.5 216.5L82.5 223.5L80 222.5L76.5 213.5Z" fill="${defaultColor()}"/>
<path d="M84.5 214.5L82.5 205H90L87.5 211.5L86.5 216.5H84.5V214.5Z" fill="${defaultColor()}"/>
<path d="M89.5 211.5L94 201.5V211.5H89.5Z" fill="${defaultColor()}"/>
<path d="M71.5 291V276L63 277.5L58 288.5L65 291H67.5L68.5 287.5V291H71.5Z" fill="${defaultColor()}"/>
<path d="M77 291V274.5L83 276L91 285.5L89.5 290H84.5V292L77 291Z" fill="${defaultColor()}"/>
</svg>
    ''';
  }

  //Back view only chart!
  String backSvg() {
    return '''
<svg width="151" height="295" viewBox="0 0 151 295" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M66 20L67.5 28L71 24.5V20H82V24.5V28L87 26.5V18L89.5 14L87 13V4L80 0H71L64.5 7V11L62.5 14L66 20Z" fill="${defaultColor()}"/>
<path d="M14.5 141L13.5 137.5L4 141.5L0.5 145.5L1.5 146.5L4.5 144.5L7.5 145.5L1.5 157.5H4.5L7.5 150.5L9 151.5L5.5 160H9L11.5 151.5H14.5L11.5 160H13.5L17 152.5V159H18.5L19.5 152.5V141H14.5Z" fill="${defaultColor()}"/>
<path d="M136.5 141H131.5V150.5L133 159.5H135.5L134.5 151.5L136.5 153L138 160H140.5L138 153H140L142.5 160L146.5 159.5L142 151.5H144L147.5 157.5H149.5L143 144.5L145 143.5L149.5 146.5L151 145V143.5L142 137.5H138L136.5 141Z" fill="${defaultColor()}"/>
<path d="M61.5 271.5L59 260.5V276.5L60 288.5H62L61.5 271.5Z" fill="${defaultColor()}"/>
<path d="M90 271.5L93.5 260.5V279L92 288.5H90V271.5Z" fill="${defaultColor()}"/>
<path d="M57 287L54.5 288.5L60 294.5H63L69 293V289.5H67L65 291.5L60.5 290.5L57 287Z" fill="${defaultColor()}"/>
<path d="M83 293V288.5L87.5 290.5H92L95.5 288.5L94.5 291.5L92 294.5H90L83 293Z" fill="${defaultColor()}"/>
<path d="M58 116H53L54.3696 105.5L58 116Z" fill="${defaultColor()}"/>
<path d="M94.5 116L98 104.5L99.5 118.5L94.5 116Z" fill="${defaultColor()}"/>
    //🤞
<path d="M65 153.5L60.5 156.5V165.5L58.5 171.5V183.5L60.5 197.5L66.5 211L69 206L68 184.5L65 176V153.5Z" fill="${fillSvg("leg")}"/>
<path d="M73 149.5L68 151.5L69 179H71L72 172.5L73 168V149.5Z" fill="${fillSvg("leg")}"/>
<path d="M79 167V149.5L83.5 151.5L84.5 176L82 178L79 167Z" fill="${fillSvg("leg")}"/>
<path d="M87 176L85.5 153.5L90.5 154.5L91.5 159L93.5 168V183.5L90.5 198.5L88.5 203L87 208L85.5 211L83.5 207H82L83.5 187.5L87 176Z" fill="${fillSvg("leg")}"/>
<path d="M96.5 183.5L95.5 160L100.5 167L103.5 183.5L99 191.5V203H96.5L94.5 191.5L96.5 183.5Z" fill="${fillSvg("leg")}"/>
<path d="M102 155.5L100.5 159V162L101 166.5L103 168.5L104.5 155.5H102Z" fill="${fillSvg("leg")}"/>
<path d="M49 169V155.5L52.5 160.5L51 167L49 169Z" fill="${fillSvg("leg")}"/>
<path d="M51 174L54 161.5H57.5L56 170.5L54.5 184.5L57.5 191L56 197.5L54.5 203.5L52.5 203V192.5L49.5 184L51 174Z" fill="${fillSvg("leg")}"/>
<path d="M59.5 203H56.5L54 214.5L52.5 235.5L58.5 246.5L60.5 242.5L58.5 235.5L59.5 203Z" fill="${fillSvg("leg")}"/>
<path d="M62.5 242.5V208L69 223.5L71 232.5V246.5L69 249L62.5 242.5Z" fill="${fillSvg("leg")}"/>
<path d="M82 223.5L91.5 208L90.5 242L82 249L81 242L82 223.5Z" fill="${fillSvg("leg")}"/>
<path d="M93.5 239.5V203.5L99 216V226V239.5L95.5 246.5L91.5 245L93.5 239.5Z" fill="${fillSvg("leg")}"/>
<path d="M62 246L59.5 248V254.5L62.5 265.5L63.5 288H66.5L69 252.5L62 246Z" fill="${fillSvg("leg")}"/>
<path d="M90 247.5L83.5 252.5L86.246 288H88.5V270L93.5 248L90 247.5Z" fill="${fillSvg("leg")}"/>
    //:)
<path d="M91.5 118L88 122.5L95 125.5L100.5 133.5L101.5 131L99 121L91.5 118Z" 
fill="${fillSvg("butt")}"/>
<path d="M64 122.5L60 118L53 121.5L50.5 133.5L52.5 132.5L57.5 125.5L64 122.5Z" fill="${fillSvg("butt")}"/>
<path d="M68 129L67 125.5L56 131L50.5 139V151.5L54.5 158L74.5 144.5L73.5 133.5L68 129Z" fill="${fillSvg("butt")}"/>
<path d="M77.5 144.5L79 132.5L86 126.5L95 129L101.5 140V152.5L99 156.5L97 158L95 154L88 151.5L77.5 144.5Z" fill="${fillSvg("butt")}"/>
    //🤞
<path d="M50.5 51.5L41.5 50.5L33.5 63.5H35.5L37 67.5L50.5 51.5Z" 
fill="${fillSvg("shoulder")}"/>
<path d="M101 53.5L115.5 67.5L117 60L112 51.5L104.5 50.5L101 53.5Z" 
fill="${fillSvg("shoulder")}"/>
    //🤞
<path d="M107 87L109 67.5L119 77V95L115.5 96.5L112 98V95L107 87Z" 
fill="${fillSvg("arm")}"/>
<path d="M120 104L116.5 99L115.5 104L111.5 103.5L116.5 118L125.5 127L120 115.5V104Z" fill="${fillSvg("arm")}"/>
<path d="M122.5 118V101.5L127.5 103.5C129 110.5 132.1 124.7 132.5 125.5C132.9
 126.3 135.333 130.5 136.5 132.5L135 135.5L133.5 138L122.5 118Z" 
 fill="${fillSvg("arm")}"/>
<path d="M44 87L42.5 67.5L32 78L31 95L38.5 96.5L44 87Z" fill="${fillSvg("arm")}"/>
<path d="M37 103.5V99L32 101.5L31 115.5L26.5 127H29L37 115.5L40 103.5H37Z" 
fill="${fillSvg("arm")}"/>
<path d="M20 125.5L26.5 101.5H31L29 115.5L24 128.5L19 136.5L15 132.5L20 125.5Z" fill="${fillSvg("arm")}"/>
    //🤞
<path d="M75.5 22.5H73L72 30.5L56 45H63L73 47L74 33L75.5 30.5V22.5Z" fill="${fillSvg("neck")}"/>
<path d="M78.5 22.5H77V33L78.5 33.5L80 47.5L85.5 45L94 43.5L80.5 33.5L80 30.5L78.5 22.5Z" fill="${fillSvg("neck")}"/>
<path d="M57 47H49L56 52L62 67L73 75.5L72 52L57 47Z" fill="${fillSvg("back")}"/>
<path d="M95 47L80 52V75.5L89 67L95 51L103 47H95Z" fill="${fillSvg("back")}"/>
<path d="M102 55.5H97L92.5 68.5L106.5 67V61L102 55.5Z" fill="${fillSvg("back")}"/>
<path d="M59.5 67L54.5 55.5H50L46 61V67H59.5Z" fill="${fillSvg("back")}"/>
<path d="M59.5 73L46 71L59.5 114.5L74 125.5L72 83L59.5 73Z" fill="${fillSvg("back")}"/>
<path d="M92.5 73L80 83L78.5 125.5L92.5 114.5L105.5 70L92.5 73Z" 
fill="${fillSvg("back")}"/>
</svg>
''';
  }

  //F+B chart!
  String bothSvg() {
    return '''
//🫡
     <svg width="319" height="295" viewBox="0 0 319 295" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M69 0L63 4V14H60.5V19.5C61.3333 20 63 21.2 63 22V30L69 34H79L84.5 30V22L87.5 19.5V14H84.5V4L79 0H69Z" fill="#CCCCCC"/>
<path d="M84.5 39.5V34L78 39.5V47H95.5L84.5 39.5Z" fill="${fillSvg("neck")}"/>
<path d="M65 40.5V35L67 34L71 39.5L71.5 47H54L65 40.5Z" fill="${fillSvg("neck")}"/>
<path d="M71 73.5V55L57.5 50L51.5 63L47.5 67.5L61.5 75L71 73.5Z" fill="${fillSvg("chest")}"/>
<path d="M77 54L86.5 50H92.5L98.5 64L102 66V68L85.5 75L77 73.5V54Z" fill="${fillSvg("chest")}"/>
<path d="M100 62.5L95.5 51L100.5 51.5L109 63.5V68L100 62.5Z" fill="${fillSvg("shoulder")}"/>
<path d="M113.5 57.5L109 51H102.5L109 60L111.5 66.5H113.5V57.5Z" fill="${fillSvg("shoulder")}"/>
<path d="M48.5 62.5L53.5 51C51.8333 51 48.5 51.1 48.5 51.5C48.5 51.9 43.1667 59 40.5 62.5V67L48.5 62.5Z" fill="${fillSvg("shoulder")}"/>
<path d="M36.5 57V67L47 51H40.5L36.5 57Z" fill="${fillSvg("shoulder")}"/>
<path id="arm" d="M110 70H101.5L102.5 81.5L105 87L111.5 93.5H115V87L110 70Z" 
fill="${fillSvg("arm")}"/>
<path id="arm" d="M119 79.5L115 74L115.5 93.5L117 94.5L120 91.5L119 79.5Z" fill="${fillSvg("arm")}"/>
<path id="arm" d="M114 103L107 98L106.506 93.5509L115.5 101V103H114Z" fill="${fillSvg("arm")}"/>
<path id="arm" d="M121 96H117.5V107L132.5 132L135 131L126.5 118V110L121 96Z" fill="${fillSvg("arm")}"/>
<path id="arm" d="M115 120.5L108 101L116 106.5L129.5 131L128 135L115 120.5Z" fill="${fillSvg("arm")}"/>
<path id="arm" d="M38 70H47L46 81.5L44 87L38 93.5509H34V96L30.5 92.5V81L34 74.5V87L38 70Z" fill="${fillSvg("arm")}"/>
<path id="arm" d="M42 98V93.5509L34 101L35.5 103L42 98Z" fill="${fillSvg("arm")}"/>
<path id="arm" d="M30.5 105V96H27L21 118L14.5 131L17 132L30.5 105Z" fill="${fillSvg("arm")}"/>
<path id="arm" d="M19.5 132L23 135L35.5 118L42 101L34 105L19.5 132Z" 
fill="${fillSvg("arm")}"/> 
<path d="M50 75.5V72L52 75.5H50Z" fill="${fillSvg("abs")}"/>
<path d="M60 77L55.5 75.5L54.5 78L60 79.5V77Z" fill="${fillSvg("abs")}"/>
<path d="M57 92L49.5 82.5V78.5L51.5 78L52 80L57.5 86.5L57 92Z" fill="${fillSvg("abs")}"/>
<path d="M52.5 79.5V78L59 81L58 86L52.5 79.5Z" fill="${fillSvg("abs")}"/>
<path d="M49.5 93.5V86.5L57.5 96V101H55.5L49.5 93.5Z" fill="${fillSvg("abs")}"/>
<path d="M59.5 105L53 102.5L52 120.5L62 127.5V125L60.5 121.5L59.5 105Z" fill="${fillSvg("abs")}"/>
<path d="M96 102.5L89.5 106L89 121L87.5 125V127.5H89.5L97.5 121.5L96 102.5Z" fill="${fillSvg("abs")}"/>
<path d="M92.5 101V95L96 92L100.5 86.5L99 95L92.5 101Z" fill="${fillSvg("abs")}"/>
<path d="M93 92.5L92.5 86.5L97.5 81V78L100.5 78.5V82.5L93 92.5Z" fill="${fillSvg("abs")}"/>
<path d="M96 78L90.5 81.5V86L92 85.5L96 81.5V78Z" fill="${fillSvg("abs")}"/>
<path d="M93 75.5L89.5 78L95.5 77.5L96 75.5H93Z" fill="${fillSvg("abs")}"/>
<path d="M100.5 75.5L97.5 72V76L100.5 75.5Z" fill="${fillSvg("abs")}"/>
<path d="M69 78.5L60.5 82.5L61 87.5H63.5L68.5 84L72 83.5V78L69 78.5Z" fill="${fillSvg("abs")}"/>
<path d="M77.5 84V78.5H82V79L88 81.5V87.5H86L82.5 84H77.5Z" fill="${fillSvg("abs")}"/>
<path d="M72 96V88.5L62 92V97.5L65 96H72Z" fill="${fillSvg("abs")}"/>
<path d="M77.5 96V88.5L87.5 91V97.5L84.5 96H77.5Z" fill="${fillSvg("abs")}"/>
<path d="M62 107V101L72 100.5V110L69 109L62 107Z" fill="${fillSvg("abs")}"/>
<path d="M78 110L77.5 101H87.5V108L81.5 109L78 110Z" fill="${fillSvg("abs")}"/>
<path d="M70.5 112L62 111L66 134L72 136L70.5 112Z" fill="${fillSvg("abs")}"/>
<path d="M86 112H77.5L76.5 136L82.5 134L86 112Z" fill="${fillSvg("abs")}"/>
<path d="M49.5 123.5L52.5 126L51 164.5L60 199L54.5 164.5V143.5L64.5 166L63.5 198L60 199H57.5L47.5 166L49.5 123.5Z" fill="${fillSvg("leg")}"/>
<path d="M96 127L99 123.5L100.5 166L91.5 199H88.5H86L82.1556 169.206L82 168L80.5 162L93.5 131.5V142.5L82 168L82.1556 169.206L96 142.5L95 166L88.5 199L97.5 166L96 127Z" fill="${fillSvg("leg")}"/>
<path d="M56 142.5V131.5L60 142.5L68 162V168L56 142.5Z" fill="${fillSvg("leg")}"/>
<path d="M73.5 189L68 171.5L65.5 200L69.5 201.5L73.5 189Z" fill="${fillSvg("leg")}"/>
<path d="M76.5 189L80.5 171.5L82.1556 200L78.5 201.5L76.5 189Z" fill="${fillSvg("leg")}"/>
<path d="M63.5 229.5L57.5 216.5L53.5 238.5L63.5 270.5L68 272.5L63.5 254V229.5Z" fill="${fillSvg("leg")}"/>
<path d="M68 261V224L72.5 229.5L71 246L69.5 266.5L68 261Z" fill="${fillSvg("leg")}"/>
<path d="M78.5 242.5V224L82.1556 231.5L83 248.5L80 266.5V247L78.5 242.5Z" fill="${fillSvg("leg")}"/>
<path d="M86 226.5L91.5 216.5L95 238.5L86 269.5L83 272.5L80 270.5L86 248.5V226.5Z" fill="${fillSvg("leg")}"/>
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
<path d="M228 153.5L223.5 156.5V165.5L221.5 171.5V183.5L223.5 197.5L229.5 211L232 206L231 184.5L228 176V153.5Z" fill="${fillSvg("leg")}"/>
<path d="M236 149.5L231 151.5L232 179H234L235 172.5L236 168V149.5Z" fill="${fillSvg("leg")}"/>
<path d="M242 167V149.5L246.5 151.5L247.5 176L245 178L242 167Z" fill="${fillSvg("leg")}"/>
<path d="M250 176L248.5 153.5L253.5 154.5L254.5 159L256.5 168V183.5L253.5 198.5L251.5 203L250 208L248.5 211L246.5 207H245L246.5 187.5L250 176Z" fill="${fillSvg("leg")}"/>
<path d="M259.5 183.5L258.5 160L263.5 167L266.5 183.5L262 191.5V203H259.5L257.5 191.5L259.5 183.5Z" fill="${fillSvg("leg")}"/>
<path d="M265 155.5L263.5 159V162L264 166.5L266 168.5L267.5 155.5H265Z" fill="${fillSvg("leg")}"/>
<path d="M212 169V155.5L215.5 160.5L214 167L212 169Z" fill="${fillSvg("leg")}"/>
<path d="M214 174L217 161.5H220.5L219 170.5L217.5 184.5L220.5 191L219 197.5L217.5 203.5L215.5 203V192.5L212.5 184L214 174Z" fill="${fillSvg("leg")}"/>
<path d="M222.5 203H219.5L217 214.5L215.5 235.5L221.5 246.5L223.5 242.5L221.5 235.5L222.5 203Z" fill="${fillSvg("leg")}"/>
<path d="M225.5 242.5V208L232 223.5L234 232.5V246.5L232 249L225.5 242.5Z" fill="${fillSvg("leg")}"/>
<path d="M245 223.5L254.5 208L253.5 242L245 249L244 242L245 223.5Z" fill="${fillSvg("leg")}"/>
<path d="M256.5 239.5V203.5L262 216V226V239.5L258.5 246.5L254.5 245L256.5 239.5Z" fill="${fillSvg("leg")}"/>
<path d="M225 246L222.5 248V254.5L225.5 265.5L226.5 288H229.5L232 252.5L225 246Z" fill="${fillSvg("leg")}"/>
<path d="M253 247.5L246.5 252.5L249.246 288H251.5V270L256.5 248L253 247.5Z" fill="${fillSvg("leg")}"/>
<path d="M254.5 118L251 122.5L258 125.5L263.5 133.5L264.5 131L262 121L254.5 118Z" fill="${fillSvg("butt")}"/>
<path d="M227 122.5L223 118L216 121.5L213.5 133.5L215.5 132.5L220.5 125.5L227 122.5Z" fill="${fillSvg("butt")}"/>
<path d="M231 129L230 125.5L219 131L213.5 139V151.5L217.5 158L237.5 144.5L236.5 133.5L231 129Z" fill="${fillSvg("butt")}"/>
<path d="M240.5 144.5L242 132.5L249 126.5L258 129L264.5 140V152.5L262 156.5L260 158L258 154L251 151.5L240.5 144.5Z" fill="${fillSvg("butt")}"/>
<path d="M213.5 51.5L204.5 50.5L196.5 63.5H198.5L200 67.5L213.5 51.5Z" fill="${fillSvg("shoulder")}"/>
<path d="M264 53.5L278.5 67.5L280 60L275 51.5L267.5 50.5L264 53.5Z" fill="${fillSvg("shoulder")}"/>
<path d="M270 87L272 67.5L282 77V95L278.5 96.5L275 98V95L270 87Z" fill="${fillSvg("arm")}"/>
<path d="M283 104L279.5 99L278.5 104L274.5 103.5L279.5 118L288.5 127L283 115.5V104Z" fill="${fillSvg("arm")}"/>
<path d="M285.5 118V101.5L290.5 103.5C292 110.5 295.1 124.7 295.5 125.5C295.9 126.3 298.333 130.5 299.5 132.5L298 135.5L296.5 138L285.5 118Z" fill="${fillSvg("arm")}"/>
<path d="M207 87L205.5 67.5L195 78L194 95L201.5 96.5L207 87Z" fill="${fillSvg("arm")}"/>
<path d="M200 103.5V99L195 101.5L194 115.5L189.5 127H192L200 115.5L203 103.5H200Z" fill="${fillSvg("arm")}"/>
<path d="M183 125.5L189.5 101.5H194L192 115.5L187 128.5L182 136.5L178 132.5L183 125.5Z" fill="${fillSvg("arm")}"/>
<path d="M238.5 22.5H236L235 30.5L219 45H226L236 47L237 33L238.5 30.5V22.5Z" fill="${fillSvg("neck")}"/>
<path d="M241.5 22.5H240V33L241.5 33.5L243 47.5L248.5 45L257 43.5L243.5 33.5L243 30.5L241.5 22.5Z" fill="${fillSvg("neck")}"/>
<path d="M220 47H212L219 52L225 67L236 75.5L235 52L220 47Z" fill="${fillSvg("back")}"/>
<path d="M258 47L243 52V75.5L252 67L258 51L266 47H258Z" fill="${fillSvg("back")}"/>
<path d="M265 55.5H260L255.5 68.5L269.5 67V61L265 55.5Z" fill="${fillSvg("back")}"/>
<path d="M222.5 67L217.5 55.5H213L209 61V67H222.5Z" fill="${fillSvg("back")}"/>
<path d="M222.5 73L209 71L222.5 114.5L237 125.5L235 83L222.5 73Z" fill="${fillSvg("back")}"/>
<path d="M255.5 73L243 83L241.5 125.5L255.5 114.5L268.5 70L255.5 73Z" fill="${fillSvg("back")}"/>
</svg>
    ''';
  }

  //Control your body view type👍
  String buildSvg(BodyViewType view) {
    switch (view) {
      case BodyViewType.front:
        return frontSvg();
      case BodyViewType.back:
        return backSvg();
      case BodyViewType.both:
        return bothSvg();
    }
  }
}
