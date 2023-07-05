import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl_standalone.dart';
import 'package:paperlog/fake_data.dart';
import 'package:paperlog/posting.dart';
import 'package:paperlog/posts.dart';
import 'package:paperlog/types.dart';
import 'package:window_size/window_size.dart';

void main() {
  findSystemLocale().then((value) {
    runApp(const PaperLogApp(app: fakeApp));
  });
}

class PaperLogApp extends StatelessWidget {
  const PaperLogApp({
    super.key,
    required this.app,
  });

  final App app;

  static AppInfo of(BuildContext context) {
    PaperLogApp? paperLogApp =
        context.findAncestorWidgetOfExactType<PaperLogApp>();

    return paperLogApp!.app.info!;
  }

  @override
  Widget build(BuildContext context) {
    AppInfo appInfo = app.info!;
    setWindowTitle(appInfo.name);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appInfo.name,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PaperLogApp.of(context).name),
        scrolledUnderElevation: 0,
      ),
      body: const Posts(),
      drawer: const MainDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Posting(),
            ),
          );
        },
      ),
    );
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      shadowColor: Colors.black,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Tags',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.label_outline),
          selectedIcon: Icon(Icons.label),
          label: Text('data'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.label_outline),
          selectedIcon: Icon(Icons.label),
          label: Text('data'),
        ),
      ],
    );
  }
}
