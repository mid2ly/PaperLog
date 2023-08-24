import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paperlog/api.dart';
import 'package:paperlog/layout.dart';
import 'package:paperlog/types.dart';
import 'package:paperlog/fake_data.dart';
import 'package:paperlog/poster.dart';
import 'package:uuid/uuid.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<Post> posts = [];

  @override
  Widget build(BuildContext context) {
    if (posts.isEmpty) {
      getPosts().then((value) {
        List<dynamic> contents = jsonDecode(value.body)['content'];
        setState(() {
          posts = contents
              .map((e) => Post(
                  author: e['author'],
                  createdAt: DateTime.parse(e['createdAt']),
                  content: e['content']))
              .toList();
        });
      });
    }

    return ListView.builder(
      itemBuilder: (context, index) => Screen(
        child: PostCard(
          post: posts[index],
        ),
      ),
      itemCount: posts.length,
      padding: const EdgeInsets.all(10.0),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    final String uuid = const Uuid().v4();
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? titleStyle = textTheme.headlineMedium;
    final TextStyle? labelStyle = textTheme.labelSmall;

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      shadowColor: Colors.transparent,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => Poster(uuid: uuid, post: post),
                transitionsBuilder: (_, animation, __, child) =>
                    FadeTransition(opacity: animation, child: child),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'post-title-$uuid',
                  child: Text(
                    post.getTitle(),
                    style: titleStyle,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Hero(
                      tag: 'post-datetime-$uuid',
                      child: Text(
                        DateFormat.yMMMMEEEEd().format(post.createdAt),
                        style: labelStyle,
                      ),
                    ),
                    const Spacer(),
                    Hero(
                      tag: 'post-author-$uuid',
                      child: Text(
                        post.author,
                        style: labelStyle,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
