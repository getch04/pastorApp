extension TitleCaseExtension on String {
  String toTitleCase() {
    if (this == "" || this.isEmpty) {
      return this;
    }

    // Split based on capital letters and spaces
    final words = this.split(RegExp(r'(?=[A-Z])|\s+'));

    return words.map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
      return '';
    }).join(' ');
  }
}
