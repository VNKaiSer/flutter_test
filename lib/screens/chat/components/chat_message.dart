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
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isMe! ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          if (!isMe!)
            CircleAvatar(
              backgroundImage: AssetImage(avatarUrl!),
            ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment:
                isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              if (!isMe!)
                Text(
                  sender!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12),
                ),
              const SizedBox(height: 4),
              for (var message in messages)
                ChatBubble(
                  isMe: isMe,
                  message: message['messages'],
                  time: message['time'],
                  isReply: message['is_reply'],
                  replyMessage: message['reply_message'],
                  makeOffer: message['make_offer'],
                  offerValue: message['offer_value'],
                  offerTime: message['offer_time'],
                  acceptedOffer: message['accepted_offer'],
                  acceptedOfferValue: message['accepted_offer_value'],
                )
            ],
          )
        ],
      ),
    );
  }
}
