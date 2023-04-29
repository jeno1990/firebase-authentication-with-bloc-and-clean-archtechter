import 'package:flutter/material.dart';
import 'package:interns_blog/features/onboarding/widgets/flexable_pic.dart';

class OnboardingPhotosGrid extends StatelessWidget {
  const OnboardingPhotosGrid({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              CurvedFlexablePic(image: images[0], fit: false, flex: 1),
              const SizedBox(
                width: 10,
              ),
              CurvedFlexablePic(image: images[1], fit: true, flex: 2),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CurvedFlexablePic(image: images[2], fit: true, flex: 2),
              const SizedBox(
                width: 10,
              ),
              CurvedFlexablePic(image: images[3], fit: false, flex: 1),
            ],
          ),
        ],
      ),
    );
  }
}
