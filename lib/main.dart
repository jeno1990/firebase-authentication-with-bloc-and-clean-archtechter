import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interns_blog/core/App/app.dart';
import 'package:interns_blog/features/auth/data/repository/authentication_repository.dart';
import 'package:interns_blog/features/auth/data/repository/user_repository_impl.dart';
import 'package:interns_blog/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:interns_blog/features/auth/presentation/bloc/form_bloc/form_bloc.dart';
import 'package:interns_blog/features/auth/presentation/bloc/third_part_login/third_party_login_bloc.dart';
import 'package:interns_blog/features/auth/presentation/pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => AuthenticationBloc(
                authenticationRepository: AuthenticationRepositoryImpl())
              ..add(AuthStartedEvent()),
          ),
          BlocProvider(
            create: (BuildContext context) => ThirdPartyLoginBloc(
                authenticationRepository: AuthenticationRepositoryImpl()),
          ),
          BlocProvider<FormBloc>(
            create: (BuildContext context) => FormBloc(
                databaseRepository: UserRepositoryImpl(),
                authenticationRepository: AuthenticationRepositoryImpl()),
          ),
          // BlocProvider(create: (context)=>)
        ],
        child: const AuthChecker(),
      ),
    );
  }
}

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        // print(state);
        if (state is AuthSuccessState) {
          return App(user: state.user);
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
