class Formatter {
  static bool canParseString(String value) {
    return int.tryParse(value.replaceAll(',', '')) != null;
  }

  static int parseString(String value) {
    return int.parse(value.replaceAll(',', ''));
  }
}
