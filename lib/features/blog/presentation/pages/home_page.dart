import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:interns_blog/features/blog/domain/entity.dart';
import 'package:interns_blog/features/blog/presentation/widgets/blog_card.dart';
import 'package:interns_blog/features/onboarding/pages/bog_detail.dart';

import '../widgets/tags.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {},
        backgroundColor: const Color(0xff669AFF),
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color(0xffE6EAF1),
      appBar: AppBar(
        title: const Text(
          'Wellcome Back!',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                ),
              ),
            ),
          ),
        ],
        backgroundColor: const Color(0xffE6EAF1),
        leading: IconButton(
            onPressed: () {
              ZoomDrawer.of(context)!.toggle();
            },
            icon: const Icon(Icons.menu, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0, right: 8, left: 8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search an article',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff669AFF),
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(14.0),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: Tags(
                    text: 'All',
                    selected: index == 0 ? true : false,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Tags(
                    text: 'Sport',
                    selected: index == 1 ? true : false,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: Tags(
                    text: 'Tech',
                    selected: index == 2 ? true : false,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 3;
                    });
                  },
                  child: Tags(
                    text: 'Polotics',
                    selected: index == 3 ? true : false,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  // shrinkWrap: true,
                  itemCount: blogs.length,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlogDetail(
                                  blog: blogs[index],
                                )));
                      },
                      child: BlogCard(blog: blogs[index]))),
            )
          ],
        ),
      ),
    );
  }
}
