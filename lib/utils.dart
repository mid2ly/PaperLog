String findTitle(String content) {
  RegExpMatch? match =
      RegExp(r'^(\s|)+#\s+(.+)$', multiLine: true).firstMatch(content);
  if (match != null) {
    return (match.group(2) ?? "").trim();
  }

  return "";
}

String findContent(String content) {
  return content
      .replaceFirst(RegExp(r'^(\s|)+#\s+(.+)$', multiLine: true), '')
      .trim();
}
