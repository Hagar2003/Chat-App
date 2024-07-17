import 'package:flutter/material.dart';
import 'package:scholar_app/constants.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.centerLeft,
      child: Container(
      padding:const EdgeInsets.only(left: 16,top: 25,bottom: 25,right: 16),
        decoration: const BoxDecoration(color: kPrimaryColor,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32),bottomRight: Radius.circular(32))
      
      ),margin: const EdgeInsets.all(8),
        child: const Text('I am a new user',style: TextStyle(color: Colors.white),),
        ),
    );
  }
}