import 'package:flutter/material.dart';
import 'package:interns_blog/features/onboarding/pages/onboarding_page2.dart';

import '../widgets/photos_grid.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> images = [
      'https://images.unsplash.com/photo-1680984580142-37e1ad42ea83?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDh8NnNNVmpUTFNrZVF8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1681111957389-ea67d854d70f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDM1fDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1605647540924-852290f6b0d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHRlY2hub2xvZ3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHRlY2hub2xvZ3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const OnboardingPhotosGrid(images: images),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Column(
                children: [
                  const Text(
                    'Read the article you want instantly',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'You can read thousandas of articles on Blog Club, save them in the application and share them with your loved ones.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff376AED),
                                borderRadius: BorderRadius.circular(20)),
                            height: 9,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 9,
                            width: 10,
                            decoration: BoxDecoration(
                                color: const Color(0xffE8ECF4),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 9,
                            width: 10,
                            decoration: BoxDecoration(
                                color: const Color(0xffE8ECF4),
                                borderRadius: BorderRadius.circular(20)),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OnboardingPage2()),
                          );
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              color: const Color(0xff376AED),
                              height: 60,
                              width: 100,
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: SizedBox(
                      width: 160,
                      child: Divider(
                        color: Color(0xffE8ECF4),
                        thickness: 6,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
