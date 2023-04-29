import 'package:flutter/material.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ProfileNumerics(
              color: Colors.blue[900],
              number: '52',
              position: 1,
              title: 'Posts'),
        ),
        const Expanded(
          child: ProfileNumerics(
              color: Colors.blue,
              number: '250',
              position: 2,
              title: 'Following'),
        ),
        const Expanded(
          child: ProfileNumerics(
              color: Colors.blue,
              number: '4.5K',
              position: 3,
              title: 'Followers'),
        ),
      ],
    );
  }
}

class ProfileNumerics extends StatelessWidget {
  const ProfileNumerics({
    super.key,
    required this.number,
    required this.title,
    this.color,
    required this.position,
  });
  final String number;
  final String title;
  final Color? color;
  final int position;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: position == 1
              ? const BorderRadius.only(
                  topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
              : position == 3
                  ? const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))
                  : const BorderRadius.all(Radius.zero)),
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
