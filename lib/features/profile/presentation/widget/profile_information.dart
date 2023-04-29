import 'package:flutter/material.dart';
import 'package:interns_blog/features/profile/presentation/widget/profile_info.dart';

class ProfileInformationCard extends StatelessWidget {
  const ProfileInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.blue, width: 2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const Image(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                '@joviedan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Jovi Daniel',
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                              Text(
                                'Ux Designer',
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      child: Text(
                        'About me',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w300),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 18.0),
                      child: Text(
                        'I design website and mobile applications. I am extream designer and no one can compite with me!',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              )),
          const Positioned(
            bottom: -20,
            right: 30,
            left: 30,
            child: ProfileInformation(),
          ),
        ],
      ),
    );
  }
}
