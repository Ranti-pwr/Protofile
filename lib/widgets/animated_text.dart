import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedTextWidget extends StatefulWidget {
  final String text;
  final TextStyle? style;

  const AnimatedTextWidget({super.key, required this.text, this.style});

  @override
  _AnimatedTextWidgetState createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _characterCount;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: false);

    _characterCount = StepTween(
      begin: 0,
      end: widget.text.length,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _characterCount,
      builder: (context, child) {
        String visibleText = widget.text.substring(0, _characterCount.value);
        return Text(
          visibleText,
          style: widget.style ?? Theme.of(context).textTheme.headlineMedium,
        );
      },
    );
  }
}
