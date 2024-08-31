extension StringCasingExtension on String {
  String get capitalize => this[0].toUpperCase() + substring(1);
  String get camelCase {
    // Remove any non-alphanumeric characters except underscores
    List<String> words = split(RegExp(r'[_\s]+'));

    if (words.isEmpty) {
      return '';
    }

    // Convert the first word to lowercase and subsequent words to capitalize
    String camelCase = words.first.toLowerCase();
    for (int i = 1; i < words.length; i++) {
      String word = words[i];
      if (word.isNotEmpty) {
        camelCase += word[0].capitalize;
      }
    }

    return camelCase;
  }

  String get snakeCase {
    // Regular expression to find uppercase letters preceded by lowercase letters or digits
    final regex = RegExp(r'([a-z0-9])([A-Z])');

    // Replace all matches by adding an underscore before the uppercase letter
    String snakeCase = replaceAllMapped(regex, (Match match) {
      return '${match.group(1)}_${match.group(2)!.toLowerCase()}';
    });

    return snakeCase.toLowerCase();
  }

  int whereFirst(String letter) {
    int index = -1;
    for (int i = 0; i < length; i++) {
      if (this[i] == letter) {
        return i;
      }
    }
    return index;
  }

  int whereLast(String letter) {
    int index = -1;
    for (int i = length - 1; i > 0; i--) {
      if (this[i] == letter) {
        return i;
      }
    }
    return index;
  }
}
