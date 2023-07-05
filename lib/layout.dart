import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 720),
          child: child,
        ),
      ],
    );
  }
}

class ScrollScreen extends StatelessWidget {
  const ScrollScreen({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 720),
            child: child,
          ),
        ],
      ),
    );
  }
}
