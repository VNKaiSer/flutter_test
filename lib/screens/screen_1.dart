import 'package:flutter/material.dart';

import '../components/index.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('A . P'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1.0,
            thickness: 1.0,
            color: Color(0xFFD1D1D1),
          ),
        ),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Product sale
          const ProductSale(
            name: "123 Dedap Link (Reverve)",
            price: "4,200,100",
            imageUrl: "assets/images/product_sale.png",
          ),
          // Chat
          const Divider(
            height: 1.0,
            thickness: 1.0,
            color: Color(0xFFD1D1D1),
          ),
          Container(
            height: 50,
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: size.width * 0.95,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ChatMessage(
                      sender: "Athalia Putri",
                      avatarUrl: "assets/images/customer_avt.png",
                      messages: [
                        {
                          'messages': "Lorem ipsum dolor sit amet",
                          'time': "2:03PM"
                        },
                        {
                          'messages': "sed do eiusmod tempor incididunt",
                          'time': "2:04PM"
                        },
                      ]),
                  ChatMessage(
                      isMe: true,
                      sender: "Me",
                      avatarUrl: "assets/images/agent_avt.png",
                      messages: [
                        {
                          'messages': "Do we need to bring anything???",
                          'time': "2:05PM",
                          'is_reply': true,
                          'reply_message': {
                            'name': "Athalia Putri",
                            'message': "Lorem ipsum dolor sit amet",
                            'time': "2:03PM"
                          }
                        },
                        {
                          "make_offer": true,
                          "offer_value": "4,200,100",
                          "offer_time": "24",
                          "time": "2:05PM"
                        },
                      ])
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
