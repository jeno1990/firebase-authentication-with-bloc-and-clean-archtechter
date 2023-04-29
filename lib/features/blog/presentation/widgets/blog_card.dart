import 'package:flutter/material.dart';

import '../../domain/entity.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key, required this.blog});
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: 200,
                        width: 150,
                        child: Hero(
                          tag: blog.title,
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(blog.image != null
                                ? blog.image!
                                : 'https://images.unsplash.com/photo-1612477954469-c6a60de89802?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHJlYWRpbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 5,
                        left: 5,
                        child: Chip(
                          backgroundColor: Colors.white,
                          label: Text(
                            '${blog.timeToRead} min read',
                          ),
                        ))
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          blog.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          maxLines: 3,
                        ),
                        Chip(
                          backgroundColor: const Color(0xff5E5F6F),
                          label: Text(
                            blog.tag,
                            style: const TextStyle(color: Colors.white),
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          elevation: 1,
                        ),
                        Text(blog.author),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Text('Jan 12,2023'),
          )
        ],
      ),
    );
  }
}
