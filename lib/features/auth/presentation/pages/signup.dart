import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interns_blog/core/App/app.dart';
import 'package:interns_blog/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:interns_blog/features/auth/presentation/bloc/form_bloc/form_bloc.dart';
import 'package:interns_blog/features/auth/presentation/widgets/signup_section.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MultiBlocListener(
      listeners: [
        BlocListener<FormBloc, FormValidate>(
          listener: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              showDialog(
                  context: context,
                  builder: (context) =>
                      ErrorDialog(errorMessage: state.errorMessage));
            } else if (state.isFormValid && !state.isLoading) {
              context.read<AuthenticationBloc>().add(AuthStartedEvent());
              context.read<FormBloc>().add(FormSuccededEvent());
            } else if (state.isFormValidateFaild) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('please the data correctly!')));
            }
          },
        ),
        BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => App(user: state.user),
              ),
              (Route<dynamic> route) => false,
            );
          }
        })
      ],
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 80.0, bottom: 20),
                    child: Image(
                      height: 100,
                      width: 200,
                      image: AssetImage('assets/images/A2SVBlue2.png'),
                    ),
                  ),
                  SignupSection()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
