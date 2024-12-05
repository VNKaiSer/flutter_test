import 'package:flutter/material.dart';
import 'package:house_test/components/suggest_message.dart';

class ChatBottomBar extends StatelessWidget {
  const ChatBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 10,
              ),
              width: size.width,
              child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Select a message or type your own',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF0F1828))),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: <Widget>[
                        SuggestMessage(
                          message: "I’m interested",
                        ),
                        SuggestMessage(
                          message: "Hello! When can we do a viewing?",
                        )
                      ]),
                    )
                  ]),
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
                Container(
                  width: size.width * 0.8,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xFF797980), width: 1),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Send a message...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFFD1D1D1)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
