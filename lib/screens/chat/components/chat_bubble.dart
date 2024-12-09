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
    this.acceptedOffer,
    this.acceptedOfferValue,
  });

  final String? message;
  final String time;
  final bool? isMe;
  final bool? isReply;
  final Map<String, dynamic>? replyMessage;
  final bool? makeOffer;
  final String? offerValue;
  final String? offerTime;
  final bool? acceptedOffer;
  final String? acceptedOfferValue;

  @override
  Widget build(BuildContext context) {
    if (acceptedOffer ?? false) {
      return _buildAcceptedOfferBubble(context);
    } else if (makeOffer ?? false) {
      return _buildMakeOfferBubble(context);
    } else {
      return _buildNormalMessageBubble(context);
    }
  }

  Widget _buildAcceptedOfferBubble(BuildContext context) {
    return _buildBubbleContainer(
      timeColor: Colors.white,
      context,
      color: const Color(0xFF108C43),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/congratulations.png',
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Accepted offer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '\$${acceptedOfferValue ?? ''}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      time: time,
    );
  }

  Widget _buildMakeOfferBubble(BuildContext context) {
    return _buildBubbleContainer(
      context,
      color: Colors.black,
      timeColor: Colors.white,
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
        ],
      ),
      time: time,
    );
  }

  Widget _buildNormalMessageBubble(BuildContext context) {
    return _buildBubbleContainer(context,
        color:
            (isMe ?? false) ? const Color(0xFFF1F1F1) : const Color(0xFFD5E4FD),
        borderRadius: (isReply ?? false)
            ? BorderRadius.circular(15)
            : BorderRadius.circular(56),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isReply ?? false) _buildReplyMessage(),
            _buildMessageRow(),
          ],
        ),
        time: time,
        timeColor: Colors.black);
  }

  Widget _buildReplyMessage() {
    return Row(
      children: [
        Container(width: 1, color: Colors.black, height: 40),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }

  Widget _buildMessageRow() {
    return Row(
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
      ],
    );
  }

  Widget _buildBubbleContainer(
    BuildContext context, {
    required Widget child,
    required Color color,
    BorderRadius? borderRadius,
    required String time,
    required Color timeColor,
  }) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 6),
      constraints: BoxConstraints(
        minWidth: size.width * 0.6,
        maxWidth: size.width * 0.7,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          child,
          Positioned(
            bottom: -2,
            right: 0,
            child: Text(
              time,
              style: TextStyle(
                color: timeColor,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
