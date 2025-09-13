import 'dart:ui';

extension HexColor on Color {
  String toHex({bool leadingHashSign = true, bool withAlpha = false}) {
    final buffer = StringBuffer();
    if (leadingHashSign) buffer.write('#');
    if (withAlpha) {
      buffer.write(alpha.toRadixString(16).padLeft(2, '0'));
    }
    buffer
      ..write(red.toRadixString(16).padLeft(2, '0'))
      ..write(green.toRadixString(16).padLeft(2, '0'))
      ..write(blue.toRadixString(16).padLeft(2, '0'));
    return buffer.toString().toUpperCase();
  }
}
