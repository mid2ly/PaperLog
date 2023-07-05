import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:paperlog/types.dart';
import 'package:paperlog/layout.dart';

class Poster extends StatefulWidget {
  const Poster({
    super.key,
    required this.uuid,
    required this.post,
  });

  final String uuid;
  final Post post;

  @override
  State<Poster> createState() => _PosterState();
}

class _PosterState extends State<Poster> {
  final ScrollController _controller = ScrollController();
  bool isScrollUnder = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        isScrollUnder = _controller.offset > 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const MainDrawer(),
      drawerEnableOpenDragGesture: false,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            primary: true,
            scrolledUnderElevation: 0,
          ),
          SliverToBoxAdapter(
            child: PosterContainer(
              uuid: widget.uuid,
              post: widget.post,
            ),
          ),
        ],
      ),
    );
  }
}

class PosterContainer extends StatelessWidget {
  const PosterContainer({
    super.key,
    required this.uuid,
    required this.post,
  });

  final String uuid;
  final Post post;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? titleStyle = textTheme.headlineMedium;
    final TextStyle? labelStyle = textTheme.labelSmall;

    return ScrollScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Hero(
              tag: 'post-title-${uuid}',
              child: Center(
                child: Text(
                  post.getTitle(),
                  style: titleStyle,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Hero(
                  tag: 'post-datetime-${uuid}',
                  child: Text(
                    DateFormat.yMMMMEEEEd().format(post.createdAt),
                    style: labelStyle,
                  ),
                ),
                const Spacer(),
                Text(
                  'Author',
                  style: labelStyle!.merge(
                    TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Hero(
                  tag: 'post-author-${uuid}',
                  child: Text(
                    post.author,
                    style: labelStyle,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MarkdownBody(
              fitContent: false,
              data: post.getContent(),
            ),
          ),
        ],
      ),
    );
  }
}
