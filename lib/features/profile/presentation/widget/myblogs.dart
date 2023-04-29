import 'package:flutter/material.dart';
import 'package:interns_blog/features/onboarding/pages/bog_detail.dart';

import '../../../blog/domain/entity.dart';

class MyBlogs extends StatelessWidget {
  const MyBlogs({super.key, required this.blog});
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BlogDetail(blog: blog)));
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        shadowColor: Colors.black54,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Container(
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(blog.image != null
                          ? blog.image!
                          : 'https://plus.unsplash.com/premium_photo-1679619558734-fd00ecb84594?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60'))),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'BIG DATA',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Text(
                      blog.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.thumb_up_outlined),
                            Text(blog.likes.toString()),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.timer_outlined),
                            Text('1hr ago'),
                          ],
                        ),
                        const Icon(
                          Icons.bookmark_sharp,
                          color: Color(0xff376AED),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
