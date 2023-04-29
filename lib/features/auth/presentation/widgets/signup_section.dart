import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interns_blog/features/auth/presentation/bloc/form_bloc/form_bloc.dart';

import '../pages/login.dart';
import 'header_text.dart';

class SignupSection extends StatefulWidget {
  const SignupSection({
    super.key,
  });

  @override
  State<SignupSection> createState() => _SignupSectionState();
}

class _SignupSectionState extends State<SignupSection> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    const EdgeInsets textformPadding =
        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue[800],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        width: width,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage()));
                  },
                  child: const Header(
                    text: 'LOGIN',
                    blur: true,
                  ),
                ),
                const Header(
                  text: 'SIGN UP',
                )
              ],
            ),
            Positioned(
                bottom: 0,
                top: 60,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white),
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28.0, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        BlocBuilder<FormBloc, FormValidate>(
                          builder: (context, state) {
                            return TextFormField(
                              onChanged: (value) {
                                context
                                    .read<FormBloc>()
                                    .add(EmailChagedEvent(email: value));
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                hintText: 'email',
                                errorText: !state.isEmailValid
                                    ? 'please ensure the email is correct e.g jow.gmail.com'
                                    : null,
                                helperStyle:
                                    const TextStyle(color: Colors.blue),
                                // helperText:
                                //     'A complete valid email e.g jow@gmail.com',
                              ),
                            );
                          },
                        ),
                        BlocBuilder<FormBloc, FormValidate>(
                          builder: (context, state) {
                            return TextFormField(
                              onChanged: (value) {
                                context
                                    .read<FormBloc>()
                                    .add(NameChangedEvent(displayName: value));
                              },
                              decoration: InputDecoration(
                                  hintText: 'username',
                                  contentPadding: textformPadding,
                                  errorText: state.isNameValid
                                      ? null
                                      : 'please add a username'),
                            );
                          },
                        ),
                        const Divider(),
                        BlocBuilder<FormBloc, FormValidate>(
                          builder: (context, state) {
                            return TextFormField(
                              onChanged: (value) {
                                context
                                    .read<FormBloc>()
                                    .add(AgeChagedEvent(age: int.parse(value)));
                              },
                              decoration: InputDecoration(
                                contentPadding: textformPadding,
                                errorText: state.isAgeValid
                                    ? null
                                    : 'Age must be valid, e.g. between 1 - 120',
                                hintText: 'age',
                                errorMaxLines: 1,
                              ),
                            );
                          },
                        ),
                        const Divider(),
                        BlocBuilder<FormBloc, FormValidate>(
                          builder: (context, state) {
                            return TextFormField(
                              onChanged: (value) {
                                context
                                    .read<FormBloc>()
                                    .add(PasswordChangedEvent(password: value));
                              },
                              obscureText: visible ? false : true,
                              decoration: InputDecoration(
                                errorMaxLines: 2,
                                errorText: state.isPasswordValid
                                    ? null
                                    : 'Password should be at least 8 characters with at least one letter and number',
                                suffix: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      visible = !visible;
                                    });
                                  },
                                  child: visible
                                      ? const Icon(Icons.remove_red_eye_rounded)
                                      : const Icon(
                                          Icons.remove_red_eye_outlined),
                                ),
                                contentPadding: textformPadding,
                                hintText: 'password',
                              ),
                            );
                          },
                        ),
                        const Spacer(),
                        BlocBuilder<FormBloc, FormValidate>(
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                context.read<FormBloc>().add(
                                    const FormSubmitedEvent(
                                        value: Status.signUp));
                              },
                              child: Container(
                                height: height / 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue[800],
                                ),
                                alignment: Alignment.center,
                                child: state.isLoading
                                    ? const CircularProgressIndicator()
                                    : const Text(
                                        'Sign Up',
                                        style: TextStyle(color: Colors.white),
                                      ),
                              ),
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Have an account?',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Center(
                          child: SizedBox(
                            width: 150,
                            child: Divider(
                              thickness: 6,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
