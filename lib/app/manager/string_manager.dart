class StringManager {
  StringManager._();

  static String formatLabel(String key) {
    return key
        .split('_')
        .map(
          (word) =>
              word.isNotEmpty
                  ? "${word[0].toUpperCase()}${word.substring(1)}"
                  : "",
        )
        .join(" ");
  }
}
