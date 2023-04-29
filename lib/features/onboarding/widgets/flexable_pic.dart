import 'package:flutter/material.dart';

class CurvedFlexablePic extends StatelessWidget {
  const CurvedFlexablePic({
    super.key,
    required this.image,
    required this.flex,
    required this.fit,
  });

  final String image;
  final int flex;
  final bool fit;
  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: flex,
        fit: fit ? FlexFit.tight : FlexFit.loose,
        child: Container(
          decoration: const BoxDecoration(
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(.4),
              //     spreadRadius: 5,
              //     blurRadius: 7,
              //     offset: const Offset(3, 9),
              //   ),
              // ],
              ),
          height: 175,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
