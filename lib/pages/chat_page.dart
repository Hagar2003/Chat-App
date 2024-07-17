import 'package:flutter/material.dart';
import 'package:scholar_app/constants.dart';
import 'package:scholar_app/widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset('assets/cippher.jpg'),
              const Text(
                'Chat',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return const ChatBuble();
              }),
            ),
            Padding(
              padding:const EdgeInsets.all(16),
              child: TextField( decoration: InputDecoration(suffixIcon: const Icon(Icons.send,
              color: kPrimaryColor,),hintText: 'Send Message',border:  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: const BorderSide(color: kPrimaryColor))),),
            )
          ],
        ));
  }
}
