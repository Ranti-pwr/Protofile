import 'package:flutter/material.dart';

class ScrollToTopButton extends StatefulWidget {
  final ScrollController scrollController;

  const ScrollToTopButton({Key? key, required this.scrollController}) : super(key: key);

  @override
  _ScrollToTopButtonState createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<ScrollToTopButton> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (widget.scrollController.offset > 300) {
      if (!_isVisible) {
        setState(() {
          _isVisible = true;
        });
      }
    } else {
      if (_isVisible) {
        setState(() {
          _isVisible = false;
        });
      }
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollToTop() {
    widget.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isVisible
        ? FloatingActionButton(
            onPressed: _scrollToTop,
            tooltip: 'Scroll to top',
            child: const Icon(Icons.arrow_upward),
          )
        : const SizedBox.shrink();
  }
}
