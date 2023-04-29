import 'package:flutter/material.dart';
import 'package:interns_blog/features/blog/domain/entity.dart';

class BlogDetail extends StatelessWidget {
  const BlogDetail({super.key, required this.blog});
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xffF4F7FF),
          body: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.chevron_left_sharp,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          const Icon(
                            Icons.more_horiz,
                            color: Colors.black,
                            size: 40,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Text(
                          blog.title,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: Hero(
                                    tag: blog.title,
                                    child: const Image(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                height: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      blog.author,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    const Text(
                                      '2m ago',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              255, 83, 119, 148)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const Icon(
                            Icons.ios_share_outlined,
                            size: 30,
                          )
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            child: SizedBox(
                              width: width,
                              height: 250,
                              child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(blog.image != null
                                      ? blog.image!
                                      : 'https://images.unsplash.com/photo-1559384960-1a620795202e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=713&q=80')),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              children: [
                                Text(
                                  blog.description,
                                  maxLines: 3,
                                  style: const TextStyle(fontSize: 23),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  blog.description,
                                  style: const TextStyle(fontSize: 21),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.white70,
                                  Colors.white54,
                                  Colors.white38,
                                  Colors.white10
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),
                          child: const Text(''),
                        )
                        // BackdropFilter(

                        //   filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        //   child: SizedBox(
                        //     width: width,
                        //     height: 50,
                        //   ),
                        // ),
                        ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: const Color(0xff376AED),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: const [
                  Icon(
                    Icons.thumb_up_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '2.1K',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
