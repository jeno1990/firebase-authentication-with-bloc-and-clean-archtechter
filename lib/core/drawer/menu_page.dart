import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interns_blog/features/auth/data/repository/authentication_repository.dart';
import 'package:interns_blog/features/auth/domain/entities/user_entity.dart';
import 'package:interns_blog/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:interns_blog/main.dart';

import 'menu_item_model.dart';

class MenuPage extends StatelessWidget {
  const MenuPage(
      {super.key,
      required this.currentItem,
      required this.onSelectedItem,
      required this.user});
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 117, 153, 231),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocProvider(
            create: (context) => AuthenticationBloc(
                authenticationRepository: AuthenticationRepositoryImpl()),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 90),
                      // height: 300,
                      child: Stack(
                        clipBehavior: Clip.hardEdge,
                        children: [
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: const Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmlsZSUyMHBpY3J1cmV8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60')),
                            ),
                          ),
                          Positioned(
                            bottom: 2,
                            left: 5,
                            right: 5,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 30,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        user.email!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const Text(
                      'UI-Ux Designer',
                      style: TextStyle(color: Colors.white),
                    ),
                    const Divider(
                      color: Colors.black45,
                      thickness: 1,
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                ...MenuItems.all.map(builMenuItem).toList(),
                const Spacer(
                  flex: 2,
                ),
                const LogOut()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget builMenuItem(MenuItem item) => ListTile(
        selectedColor: Colors.white,
        selectedTileColor: Colors.black45,
        selected: item == currentItem,
        minLeadingWidth: 20,
        leading: Icon(item.icon),
        title: Text(item.text),
        onTap: () {
          onSelectedItem(item);
        },
      );
}

class LogOut extends StatelessWidget {
  const LogOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: true,
      selectedTileColor: Colors.black12,
      minLeadingWidth: 2,
      onTap: () {
        print('logout');
        context.read<AuthenticationBloc>().add(AuthSignoutEvent());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
      },
      leading: const Icon(
        Icons.logout,
        color: Colors.white,
      ),
      title: const Text(
        'Log out',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
      // tileColor: Colors.brown,
    );
  }
}

class MenuItems {
  static MenuItem homePage = MenuItem(text: 'Dashboard', icon: Icons.home);
  static MenuItem profile = MenuItem(text: 'Profile', icon: Icons.person);
  static MenuItem blogAdd = MenuItem(text: 'AddBlog', icon: Icons.add_card);
  static MenuItem payment =
      MenuItem(text: 'payment', icon: Icons.payment_outlined);
  // static MenuItem homePage = MenuItem(text: 'HomePage', icon: Icons.menu);

  static var all = <MenuItem>[homePage, profile, blogAdd, payment];
}
