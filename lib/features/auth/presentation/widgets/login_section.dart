import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/form_bloc/form_bloc.dart';
import '../pages/signup.dart';
import 'header_text.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({
    super.key,
  });

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                const Header(
                  text: 'LOGIN',
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ),
                    );
                  },
                  child: const Header(
                    text: 'SIGN UP',
                    blur: true,
                  ),
                )
              ],
            ),
            Positioned(
                bottom: 0,
                top: 50,
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
                        const Text(
                          'Wellcome Back',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'sign in with you account',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        BlocBuilder<FormBloc, FormValidate>(
                          builder: (context, state) {
                            return TextFormField(
                              onChanged: (value) {
                                context
                                    .read<FormBloc>()
                                    .add(EmailFieldTouchedEvent());
                                context
                                    .read<FormBloc>()
                                    .add(EmailChagedEvent(email: value));
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                hintText: 'email',
                                errorText: !state.isEmailValid &&
                                        state.emailTyped
                                    ? 'please ensure the email e.g jow.gmail.com'
                                    : null,
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
                                        value: Status.signIn));
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
                                        'LOGIN',
                                        style: TextStyle(color: Colors.white),
                                      ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: height / 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Forget your password?',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Reset here',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height / 30,
                        ),
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
