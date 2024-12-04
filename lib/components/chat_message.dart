import 'package:flutter/material.dart';

import 'chat_bubble.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
    required this.sender,
    required this.avatarUrl,
    required this.messages,
    this.isMe = false,
  });
  final String? sender;
  final String? avatarUrl;
  final List<Map<String, dynamic>> messages;
  final bool? isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          isMe! ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        if (!isMe!)
          CircleAvatar(
            backgroundImage: AssetImage(avatarUrl!),
          ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment:
                isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (!isMe!)
                Text(
                  sender!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12),
                ),
              const SizedBox(
                height: 4,
              ),
              for (int i = 0; i < messages.length; i++)
                ChatBubble(
                  isMe: isMe,
                  message: messages[i]['messages'],
                  time: messages[i]['time'],
                  isReply: messages[i]['is_reply'],
                  replyMessage: messages[i]['reply_message'],
                  makeOffer: messages[i]['make_offer'],
                  offerValue: messages[i]['offer_value'],
                  offerTime: messages[i]['offer_time'],
                )
            ],
          ),
        )
      ],
    );
  }
}
