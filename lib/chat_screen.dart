import 'dart:convert';
import 'package:Morphery/message.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatScreen extends StatefulWidget {
  //const ChatScreen({super.key});
  const ChatScreen({Key? key}) : super(key: key);
@override
State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
TextEditingController controller = TextEditingController();
ScrollController scrollController = ScrollController();
List<Message> msgs = [];
bool isTyping = false;
String receivedText = ''; //variable to hold received text

@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    receiveSelectedText(); // Call receiveSelectedText after dependencies changed
  }

  //receive selected text
  void receiveSelectedText() {
    final String? selectedText = ModalRoute.of(context)?.settings.arguments as String?;
    if (selectedText != null) {
      setState(() {
        receivedText = selectedText;
        print('successfully received: $receivedText, sending message');
        sendMsg();
      });
    }
  }

void sendMsg() async {
  String text = receivedText;
  receivedText = '';
  //String text = controller.text;
	String apiKey = "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";
	controller.clear();
	try {
	if (text.isNotEmpty) {
		setState(() {
		msgs.insert(0, Message(true, text));
		isTyping = true;
		});
    
		// scrollController.animateTo(0.0,
		// 	duration: const Duration(seconds: 1), curve: Curves.easeOut);
		var response = await http.post(
			Uri.parse("https://api.openai.com/v1/chat/completions"),
			headers: {
			"Authorization": "Bearer $apiKey",
			"Content-Type": "application/json"
			},
			body: jsonEncode({
			"model": "gpt-3.5-turbo",
			"messages": [
        {"role": "system", "content": "explain '$text' like Im 5 in 50 words"},
				//{"role": "user", "content": text}
			],
      "temperature": 0.7,
      "top_p": 0.7
			}));
		if (response.statusCode == 200) {
		var json = jsonDecode(response.body);
		setState(() {
			isTyping = false;
			msgs.insert(
				0,
				Message(
					false,
					json["choices"][0]["message"]["content"]
						.toString()
						.trimLeft()));
		});
		// scrollController.animateTo(0.0,
		// 	duration: const Duration(seconds: 2), curve: Curves.easeOut);
		}
  
	}
	} on Exception {
	ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
		content: Text("Some error occurred, please try again!")));
	}
  text = '';
  print('text cleared');
}

@override
Widget build(BuildContext context) {
	return Scaffold(
    backgroundColor: const Color.fromRGBO(255, 223, 194, 1),

	appBar: AppBar(
        title: const Text(
          'Your personal teacher', 
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Signika', 
            color: Color.fromRGBO(32, 44, 89, 1), ), 
        ),
        backgroundColor: const Color.fromRGBO(255, 184, 51, 1),
      ),

	body: Align(
    alignment: Alignment.topCenter,
    child: Column(
		children: [
		//  SizedBox(
		//  	height: MediaQuery.of(context).size.height * 0.2,),

		Expanded(
			child: ListView.builder(
				controller: scrollController,
				itemCount: msgs.length,
				shrinkWrap: true,
				reverse: true,
				itemBuilder: (context, index) {
				return Padding(
					padding: const EdgeInsets.symmetric(vertical: 4),
          
					child: isTyping && index == 0
						? Column(
							children: [
								BubbleNormal(
								text: msgs[0].msg,
                tail: false,
                textStyle: const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Signika', color: Color.fromRGBO(32, 44, 89, 1), fontSize: 18,),
								isSender: false,
								color: const Color.fromRGBO(255, 205, 0, 1),
								),

								const Padding(
								padding: EdgeInsets.only(left: 28, top: 4),
								child: Align(
									alignment: Alignment.centerLeft,
									child: Text("Responding...", style: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Signika', color: Color.fromRGBO(32, 44, 89, 1), fontSize: 18,),)),
								)
							],
							)
						: BubbleNormal(
              bubbleRadius: BUBBLE_RADIUS,
              tail: false,
							text: msgs[index].msg,
              textStyle: const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Signika', color: Color.fromRGBO(32, 44, 89, 1), fontSize: 18,),
							isSender: msgs[0].isSender,
							color: msgs[index].isSender
								? const Color.fromRGBO(255, 184, 51, 1)
								: const Color.fromRGBO(255, 184, 51, 1),
							),
              );
				}),
		),
		Row(
			children: [
			Expanded(
				child: Padding(
				padding: EdgeInsets.only(bottom: 10.0),
				child: SizedBox(
		  	height: MediaQuery.of(context).size.height * 0.3,
		    ),
		// 			decoration: BoxDecoration(
		// 				color: Colors.grey[200],
		// 				borderRadius: BorderRadius.circular(10)),
		// 			child: Padding(
		// 			padding: const EdgeInsets.symmetric(horizontal: 8),
		// 			child: TextField(
		// 				controller: controller,
		// 				textCapitalization: TextCapitalization.sentences,
		// 				onSubmitted: (value) {
		// 				sendMsg();
		// 				},
		// 				textInputAction: TextInputAction.send,
		// 				showCursor: true,
		// 				decoration: const InputDecoration(
		// 					border: InputBorder.none, hintText: "Enter text"),
		// 			),
		// 			),
		// 		),
				
			),
		// 	InkWell(
		// 		onTap: () {
		// 		sendMsg();
		// 		},
		// 		child: Container(
		// 		height: 40,
		// 		width: 40,
		// 		decoration: BoxDecoration(
		// 			color: Colors.blue,
		// 			borderRadius: BorderRadius.circular(30)),
		// 		child: const Icon(
		// 			Icons.send,
		// 			color: Colors.white,
		// 		),
		// 		),
			),
			SizedBox(
				width: 8,
			)
			],
		),
		],
	),)
	);
}
}
