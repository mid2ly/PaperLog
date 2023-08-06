import 'package:flutter/material.dart';
import 'package:paperlog/poster.dart';
import 'package:paperlog/types.dart';

class Posting extends StatelessWidget {
  const Posting({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('New Posting'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Publish'),
          ),
          IconButton(
            onPressed: () {
              _preview(context, _controller);
            },
            icon: const Icon(Icons.preview),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.multiline,
                  maxLength: null,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    label: Text('Content'),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _preview(BuildContext context, TextEditingController controller) {
    showModalBottomSheet(
      context: context,
      constraints: const BoxConstraints(maxWidth: 720),
      builder: (context) => BottomSheet(
        onClosing: () {},
        builder: (context) => SizedBox(
          child: PosterContainer(
            uuid: 'preview',
            post: Post(
              author: 'Middly',
              createdAt: DateTime.now(),
              content: controller.text,
            ),
          ),
        ),
      ),
    );
  }
}
