import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  const Tags({
    super.key,
    required this.text,
    required this.selected,
  });
  final String text;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Chip(
      side: const BorderSide(color: Colors.blue),
      elevation: 2,
      label: Text(
        text,
        style: TextStyle(color: selected ? Colors.white : Colors.blue),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      backgroundColor: selected ? Colors.blue : Colors.white,
    );
  }
}
