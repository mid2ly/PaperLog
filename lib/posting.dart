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
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.format_color_text_rounded),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.format_color_fill_rounded),
                    ),
                    const SizedBox(width: 10),
                    SegmentedButton(
                      onSelectionChanged: (value) {},
                      showSelectedIcon: false,
                      segments: [
                        ButtonSegment(
                          value: 'value',
                          icon: const Icon(Icons.format_bold_rounded),
                        ),
                        ButtonSegment(
                          value: 'value2',
                          icon: const Icon(Icons.format_italic_rounded),
                        ),
                        ButtonSegment(
                          value: 'value3',
                          icon: const Icon(Icons.format_underline_rounded),
                        ),
                        ButtonSegment(
                          value: 'value4',
                          icon: const Icon(Icons.format_strikethrough_rounded),
                        ),
                      ],
                      selected: const {
                        'value',
                      },
                    ),
                    const SizedBox(width: 10),
                    SegmentedButton(
                      onSelectionChanged: (value) {},
                      showSelectedIcon: false,
                      segments: [
                        ButtonSegment(
                          value: 'value',
                          icon: const Icon(Icons.format_align_left_rounded),
                        ),
                        ButtonSegment(
                          value: 'value2',
                          icon: const Icon(Icons.format_align_center_rounded),
                        ),
                        ButtonSegment(
                          value: 'value3',
                          icon: const Icon(Icons.format_align_right_rounded),
                        ),
                      ],
                      selected: const {
                        'value',
                      },
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => _preview(context, _controller),
                      icon: const Icon(Icons.preview_outlined),
                    ),
                  ],
                ),
              ),
            ),
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
      isScrollControlled: true,
      builder: (context) => BottomSheet(
        onClosing: () {},
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height - 20,
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
