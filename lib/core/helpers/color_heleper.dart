import 'dart:math';
import 'dart:ui';

class ColorHeleper {
  static final Random _random = Random();
  static Color getRandomColor() {
    int colorValue = _random.nextInt(0xFFFFFF + 1);
    return Color(0xFF000000 | colorValue);
  }
}
