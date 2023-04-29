import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:interns_blog/features/blog/domain/entity.dart';
import 'package:interns_blog/features/profile/presentation/widget/profile_information.dart';

import '../widget/myblogs.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FF),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        ZoomDrawer.of(context)!.toggle();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff0D253C),
                      ),
                    ),
                    const Icon(Icons.more_horiz,
                        size: 30, color: Color(0xff0D253C))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const ProfileInformationCard()
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'My Posts',
                        style: TextStyle(fontSize: 23),
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.apps_outage_sharp,
                            size: 23,
                            color: Color(0xff376AED),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.message_rounded,
                            size: 23,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: blogs.length,
                      itemBuilder: (context, index) => MyBlogs(
                        blog: blogs[index],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
