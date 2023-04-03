import 'package:chat_app/models/model.dart';
import 'package:chat_app/widget/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import '../widget/chatContainer.dart';

class ChatApp extends StatefulWidget {
  final String email;
  const ChatApp({super.key, required this.email});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt).snapshots(),
      builder: (context, snapshot) {
        List<Message> messagesList = [];
        if (snapshot.hasData) {
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(
              Message.fromJson(snapshot.data!.docs[i]),
            );
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar,
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messagesList.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      var reverseIndex = messagesList.length - index - 1;
                      return messagesList[reverseIndex].id == widget.email
                          ? CustomContainer(
                              messages: messagesList[reverseIndex],
                            )
                          : CustomContainer1(
                              messages: messagesList[reverseIndex]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) => sendMessage(),
                    decoration: InputDecoration(
                      hintText: "Send Message",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo.shade900),
                          borderRadius: BorderRadius.circular(16)),
                      suffixIcon: IconButton(
                        onPressed: () => sendMessage(),
                        icon: Icon(
                          Icons.send,
                          color: Colors.indigo.shade900,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return loading;
        }
      },
    );
  }

  void sendMessage() {
    messages.add({
      kMessages: controller.text, // الماسج الي ببعتها
      kCreatedAt: DateTime.now(),
      'id': widget.email, // هبعت كمان الايميل
    });
    controller.clear();
  }
}

Center get loading => const Center(child: CircularProgressIndicator());
