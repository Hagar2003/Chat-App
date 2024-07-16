import 'package:flutter/material.dart';
import 'package:scholar_app/pages/register_page.dart';
import 'package:scholar_app/widgets/custom_button.dart';
import 'package:scholar_app/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
                  hint: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: 'Password',
                ),
                const SizedBox(
                  height: 10,
                ),
                 CustomButton(text:'Login'),
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
                          return   RegisterScreen();
                        }));
                      },
                      child: const Text(
                        '  Register',
                        style: TextStyle(color: Color.fromARGB(255, 191, 234, 245)),
                      ),
                    )
                  ],
                )
              ]),
            )));
  }
}
