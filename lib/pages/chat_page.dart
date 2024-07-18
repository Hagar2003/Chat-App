import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_app/constants.dart';
import 'package:scholar_app/models/message_model.dart';
import 'package:scholar_app/widgets/chat_bubble.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  ChatPage({super.key,});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('createdAt').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
                appBar: AppBar(
                  title: const Row(
                    children: [
                      //  Image.asset(''),
                      Center(
                        child: Text(
                          ' Chat',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  centerTitle: true,
                  backgroundColor: kPrimaryColor,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder( itemCount:messagesList.length,itemBuilder:  (context, index) {
                        return  ChatBuble(message: messagesList[index],);
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        onSubmitted: (value) {
                          messages.add({'message': value,
                          'createdAt':DateTime.now()});
                          controller.clear();
                        },
                        controller: controller,
                        decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.send,
                              color: kPrimaryColor,
                            ),
                            hintText: 'Send Message',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: kPrimaryColor))),
                      ),
                    )
                  ],
                ));
          } else {
            return const Text('Loading......');
          }
        });
  }
}
