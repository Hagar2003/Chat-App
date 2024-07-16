import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_app/widgets/custom_button.dart';
import 'package:scholar_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({
    super.key,
  });
  //VoidCallback? onTap;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color(0xff2B475E),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
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
                      'Register',
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
                  onTap: () async {
                    try {
                      var auth = FirebaseAuth.instance;
                      UserCredential user =
                          await auth.createUserWithEmailAndPassword(
                              email: email!, password: password!);
                    } catch (e) {
                      //print(e);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('there was an error ,try later')));
                    }
                    //  print(user.user!.displayName);
                  },
                  text: 'Register',
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
                        //  Navigator.pushNamed(context, 'LoginPage');
                        Navigator.pop(context);
                      },
                      child: const Text(
                        '  Login',
                        style: TextStyle(
                            color: Color.fromARGB(255, 191, 234, 245)),
                      ),
                    )
                  ],
                )
              ]),
            )));
  }
}
