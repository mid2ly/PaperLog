import 'package:paperlog/utils.dart';

class App {
  const App({
    required this.setup,
    required this.setupToken,
    required this.info,
  });

  final bool setup;
  final String? setupToken;

  final AppInfo? info;
}

class AppInfo {
  const AppInfo({
    required this.name,
  });

  final String name;
}

class Post {
  const Post({
    required this.author,
    required this.createdAt,
    required this.content,
  });

  final String author;
  final DateTime createdAt;
  final String content;

  String getTitle() {
    return findTitle(content);
  }

  String getContent() {
    return findContent(content);
  }
}
