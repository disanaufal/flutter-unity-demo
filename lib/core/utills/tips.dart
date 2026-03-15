import 'dart:math';

class TipsHelper {

  static const List<String> _tips = [

    "Gunakan dua jari untuk menggeser model tulang.",
    "Ketuk dua kali untuk fokus pada bagian tulang.",
    "Cubit layar untuk memperbesar atau memperkecil model.",
    "Putar model untuk melihat struktur dari berbagai sisi.",
    "Gunakan mode AR untuk melihat anatomi di dunia nyata.",

  ];

  static String randomTip() {
    final random = Random();
    return _tips[random.nextInt(_tips.length)];
  }
}