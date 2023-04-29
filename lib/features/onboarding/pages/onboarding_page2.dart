import 'package:flutter/material.dart';
import 'package:interns_blog/features/auth/presentation/pages/login.dart';

import '../widgets/photos_grid.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> images = [
      'https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dGVjaG5vbG9neXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      'https://plus.unsplash.com/premium_photo-1661662835250-7c7f20432351?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHRlY2hub2xvZ3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDR8fHRlY2hub2xvZ3l8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60',
      'https://plus.unsplash.com/premium_photo-1671611822374-4719df5c89bb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjF8fHRlY2hub2xvZ3l8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60',
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
            Column(
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
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: const Color(0xff376AED),
                            height: 50,
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
            )
          ],
        ),
      ),
    );
  }
}
