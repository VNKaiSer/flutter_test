import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
    required this.time,
    this.isMe = false,
    this.isReply = false,
    this.replyMessage,
    this.makeOffer,
    this.offerValue,
    this.offerTime,
  });
  final String? message;
  final String time;
  final bool? isMe;
  final bool? isReply;
  final Map<String, dynamic>? replyMessage;
  final bool? makeOffer;
  final String? offerValue;
  final String? offerTime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (makeOffer ?? false == true) {
      return Container(
        margin: const EdgeInsets.only(top: 6),
        constraints: BoxConstraints(
          minWidth: size.width * 0.6,
          maxWidth: size.width * 0.6,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Made an offer: ',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\$$offerValue',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Offer expires in $offerTime hours',
              style: const TextStyle(
                color: Color(0xFFFBFBFB),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: Transform.translate(
                offset: const Offset(0, 2),
                child: Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xFFFBFBFB),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 6),
      constraints: BoxConstraints(
        minWidth: size.width * 0.7,
        maxWidth: size.width * 0.7,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: (isMe ?? false) == true
            ? const Color(0xFFF1F1F1)
            : const Color(0xFFD5E4FD),
        borderRadius: (isReply ?? false) == true
            ? BorderRadius.circular(15)
            : BorderRadius.circular(56),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isReply ?? false)
            Row(
              children: [
                Container(width: 1, color: Colors.black, height: 40),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      replyMessage!['name'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      replyMessage!['message'],
                      style: const TextStyle(
                        color: Color(0xFF797980),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          makeOffer ?? false == true
              ? const SizedBox()
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        message!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Transform.translate(
                        offset: const Offset(0, 4),
                        child: Text(
                          time,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
