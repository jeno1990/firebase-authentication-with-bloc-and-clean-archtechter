import 'package:equatable/equatable.dart';

class Blog extends Equatable {
  final String? image;
  final int likes = 0;
  final String description;
  final String title;
  final String timeToRead;
  final String author;

  final String tag;

  const Blog(
      {this.image,
      required this.description,
      required this.title,
      required this.timeToRead,
      required this.author,
      required this.tag});

  @override
  List<Object?> get props =>
      [image, likes, description, title, timeToRead, author, tag];
}

const String text =
    "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?";
const List<Blog> blogs = [
  Blog(
      description: text,
      title: 'Future Schooling Will be Deffrent',
      timeToRead: '12',
      author: 'Alicia Barkes',
      image:
          'https://plus.unsplash.com/premium_photo-1664528356364-f55f9f60fa42?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8c2Nob29saW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      tag: 'school'),
  Blog(
      description: text,
      title: 'Rooney Speaks About Man United And Ten Hag',
      timeToRead: '12',
      author: 'Jhon Stones',
      image:
          'https://images.unsplash.com/photo-1508098682722-e99c43a406b2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Zm9vdGJhbGx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      tag: 'Premierlegue'),
  Blog(
      description: text,
      title: 'Barak Obama Is Not Black Any More',
      timeToRead: '20',
      author: 'Lil wayne',
      image:
          'https://images.unsplash.com/photo-1535902307019-63b3ca1577d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8b2JhbWF8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      tag: 'America'),
  Blog(
      description: text,
      title: 'The Goal To Rescue Your Mind',
      timeToRead: '4',
      author: 'Gash Doctor',
      image:
          'https://images.unsplash.com/photo-1507413245164-6160d8298b31?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWluZHNldHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      tag: 'Mindset'),
];
