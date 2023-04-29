import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.text,
    this.blur,
  });
  final String text;
  final bool? blur;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Text(
        text,
        style: TextStyle(
            color: blur != null ? Colors.grey : Colors.white, fontSize: 20),
      ),
    );
  }
}
