import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interns_blog/core/App/app.dart';
import 'package:interns_blog/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:interns_blog/features/auth/presentation/bloc/form_bloc/form_bloc.dart';

import '../widgets/login_section.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MultiBlocListener(
      listeners: [
        BlocListener<FormBloc, FormValidate>(listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            showDialog(
                context: context,
                builder: (context) =>
                    ErrorDialog(errorMessage: state.errorMessage));
          } else if (state.isFormValidateFaild) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('please check the input again')));
          } else if (state.isFormValid && !state.isLoading) {
            context.read<AuthenticationBloc>().add(AuthStartedEvent());
          }
        }),
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => App(
                            user: state.user,
                          )),
                  (Route<dynamic> route) => false);
            }
          },
        ),
      ],
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0, bottom: 20),
                    child: Image(
                      height: height / 9,
                      width: 200,
                      image: const AssetImage('assets/images/A2SVBlue2.png'),
                    ),
                  ),
                  const LoginSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  final String? errorMessage;
  const ErrorDialog({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Error"),
      content: Text(errorMessage!),
      actions: [
        TextButton(
          child: const Text("Ok"),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
