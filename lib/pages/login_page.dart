import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_app/pages/chat_page.dart';
import 'package:scholar_app/pages/register_page.dart';
import 'package:scholar_app/widgets/custom_button.dart';
import 'package:scholar_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
              backgroundColor: const Color(0xff2B475E),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Form(
                  key: formKey,
                  child: Column(children: [
                    //  Image.asset(''),
                    const SizedBox(height: 200),
                    const Text('Scholar Chat',
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Sign ',
                          style: TextStyle(
                            fontSize: 23, //use row here if it is in center
                            fontWeight: FontWeight.bold, color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      onChanged: (data) {
                        email = data;
                      },
                      hint: 'Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        password = data;
                      },
                      hint: 'Password',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      text: 'Login',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            var auth = FirebaseAuth.instance;
                            // ignore: unused_local_variable
                            UserCredential user =
                                await auth.signInWithEmailAndPassword(
                                    email: email!, password: password!);
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, 'ChatPage');
                          } catch (e) {
                            //print(e);
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('there was an error ,try later')));
                          }
                          //  print(user.user!.displayName);

                          isLoading = false;
                          setState(() {});
                        } else {}
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'don\'t have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const RegisterScreen();
                            }));
                          },
                          child: const Text(
                            '  Register',
                            style: TextStyle(
                                color: Color.fromARGB(255, 191, 234, 245)),
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              )),
        ));
  }
}
