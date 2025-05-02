import 'package:flutter/material.dart';

class DarkModeToggle extends StatefulWidget {
  final ValueChanged<bool> onToggle;

  const DarkModeToggle({super.key, required this.onToggle});

  @override
  State<DarkModeToggle> createState() => _DarkModeToggleState();
}

class _DarkModeToggleState extends State<DarkModeToggle> {
  bool isDarkMode = false;

  void _toggle() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
    widget.onToggle(isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
      tooltip: 'Toggle Dark Mode',
      onPressed: _toggle,
    );
  }
}
