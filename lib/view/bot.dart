import 'package:ecare/controller/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/media/sound.dart';

class ChatBot extends StatefulWidget {
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  late String? Username = 'Jishnu';
  late String? Email= 'jishnuk123@gmail.com';
  late String? phno= '8111931432';
  final TextEditingController _textController = TextEditingController();
  final  SoundService sound= SoundService();
  final List<ChatMessage> _messages = [];

  int currentQuestionIndex = 0;
  List<Question> healthQuestions = [
    Question("Are you sponsor or provider",""),
    Question("What is your blood group?", "bloodGroup"),
    Question("Do you have any existing health conditions?", "healthConditions"),
    // Add more questions as needed
  ];

  @override
  void initState() {
    super.initState();
    sharedpref();
    _askNextQuestion();

  }

  sharedpref()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();

     Email = await prefs.getString('Email');
     Username = await prefs.getString('Pusername');
     phno = await prefs.getString('Phno');
  }

  _askNextQuestion() {
    setState(() {
      
      
    });
    Future.delayed(Duration(seconds: 2), () {
      if (currentQuestionIndex < healthQuestions.length) {
        if (currentQuestionIndex == 0) {
          // Show buttons for sponsor or provider selection
          setState(() {
            _messages.add(ChatMessage(text: 'Hi', isUser: false),);
            _messages.add(ChatMessage(text: 'WELCOME TO ECARE',textStyle: TextStyle(fontSize: 70,fontWeight: FontWeight.w900,fontFamily: 'Decorative ',color: Colors.green), isUser: false,),);
            _messages.add(ChatMessage(text: 'Are you lookig asistance for yourself or some others', isUser: false),);
            _messages.add(
              ChatMessage(
                text: '', // Empty text, as we're going to replace it with buttons
                isUser: true,
                customWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(style:ButtonStyle(backgroundColor:MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          return Colors.blue;

                        }
                    ),
            ),

                      onPressed: () {
                        // User selected Sponsor
                        sound.playSound2();
                        _handleBotResponse('Yourself');
                      },
                      child: Text('Myself',style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(

                      style:ButtonStyle(backgroundColor:MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              return Colors.blue;

            }
            ),
            // return Colors.amberAccent; ,
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          // return Colors.amberAccent;
                          if (states.contains(MaterialState.hovered))
                            return Colors.blue; //<-- SEE HERE
                          return Colors.green; // Defer to the widget's default.
                        },
                      ),
                    ),                      onPressed: () {
                        // User selected Provider
                      sound.playSound2();
                        _handleBotResponse('Relative');
                      },
                      child: Text('Relative',style: TextStyle(color: Colors.white),),
                    ),

                    SizedBox(width: 10),
                    ElevatedButton(
                      style:ButtonStyle(backgroundColor:MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            return Colors.blue;

                          }
                      ),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Colors.redAccent; //<-- SEE HERE
                            return Colors.green; // Defer to the widget's default.
                          },
                        ),
                      ),

                      onPressed: () {
                        // User selected Provider
                        sound.playSound2();
                        _handleBotResponse('Friend');
                      },
                      child: Text('Friend',style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            );
            // _messages.add(
            //   ChatMessage(
            //     text: 'Are you a sponsor or provider?',
            //     isUser: false,
            //   ),
            // );
            // _messages.add(
            //   ChatMessage(
            //     text: '', // Empty text, as we're going to replace it with buttons
            //     isUser: true,
            //     customWidget: Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         ElevatedButton(
            //
            //           onPressed: () {
            //             // User selected Sponsor
            //             _handleBotResponse('Sponsor');
            //           },
            //           child: Text('Sponsor'),
            //         ),
            //         SizedBox(width: 10),
            //         ElevatedButton(
            //           onPressed: () {
            //             // User selected Provider
            //             _handleBotResponse('provider');
            //           },
            //           child: Text('Provider'),
            //         ),
            //
            //
            //       ],
            //     ),
            //   ),
            // );
          });
        } else if (currentQuestionIndex == 1) {
          // Ask about services based on the previous selection
          String previousSelection = _messages.last.text; // Get the last message
          setState(() {
            _messages.add(
              ChatMessage(
                text: 'What service do you want?',
                isUser: false,
              ),
            );
            _messages.add(
              ChatMessage(
                text: '', // Empty text, as we're going to replace it with buttons
                isUser: true,
                customWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor:MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              return Colors.blue;

              }
              ),

                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Colors.redAccent; //<-- SEE HERE
                            return null; // Defer to the widget's default.
                          },
                        ),
                      ),
                      onPressed: () {
                        // User selected a service (customize as needed)
                        _handleBotResponse('Service A');
                        sound.playSound2();
                      },
                      child: Text('Service A',style:  TextStyle(color:  Colors.white),),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
            style:ButtonStyle(backgroundColor:MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  return Colors.blue;

                }
            ),
            ),
                      onPressed: () {
                        // User selected another service (customize as needed)
                        _handleBotResponse('Service B');
                        sound.playSound2();
                      },
                      child: Text('Service B',style: TextStyle(color: Colors.white),),
                    ),
                    // Add more buttons for additional services
                  ],
                ),
              ),
            );
          });
        } else {
          // No more questions, conversation completed
          ChatMessage completionMessage = ChatMessage(
            text: 'Thank you for providing information. Conversation completed.',
            isUser: false,
          );
          setState(() {
            _messages.add(completionMessage);
          });
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pushReplacementNamed(context, 'home');
          });
        }
      }
    });
  }


  void _handleSubmitted(String text) {
    ChatMessage userMessage = ChatMessage(
      text: text,
      isUser: true,
    );
    setState(() {
      _messages.add(userMessage);
    });

    // Process user response and generate bot response
    _handleBotResponse(text);
    _textController.clear();
  }

  void _handleBotResponse(String userMessage) {
    // Simulate processing user response and generating bot response
    // For simplicity, we're just echoing the user's response in this example
    Future.delayed(Duration(seconds: 2), () {
      ChatMessage botMessage = ChatMessage(
        text: 'Ecare: You said: "$userMessage"',
        isUser: false,
      );
      setState(() {
        _messages.add(botMessage);
      });

      // Move to the next question
      currentQuestionIndex++;
      _askNextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back,color: Colors.black,),
          onTap: () {
            Navigator.popAndPushNamed(context, 'signin');
          },
        ),
        clipBehavior: Clip.antiAlias,
        backgroundColor: Color(0xFF009EDC),
        centerTitle: true,
        title: const Text('Ecare',style:  TextStyle(color: Colors.white,letterSpacing: 0.25,fontSize: 17 ),),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(33))),
        actions: [
          InkWell(
            onTap: (){},
            child: const Padding(padding: EdgeInsets.all(8.0),child: Icon(Icons.notifications,size: 20,color: Colors.lime,),),
          )

        ],
        bottom: PreferredSize(preferredSize: const Size.fromHeight(100.0),
        child: Container(
          padding: const EdgeInsets.only(left: 30, bottom: 20),
          child: Row(children: [
            Stack(children: [
              const CircleAvatar(
                radius: 32,
                backgroundColor: Colors.white,
                child: Icon(Icons.person_2_outlined,),
              ),
              Container(
                height: 30,
                  width: 30,
                decoration: const BoxDecoration(color:Colors.green,borderRadius: BorderRadius.all(Radius.circular(20)),),
                child: const Icon(Icons.edit,size: 20,color: Color(0xFF4169e1),),
              ),

            ],),
            Container(
              margin: const EdgeInsets.only(left: 17),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$Username",
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Colors.white)),
                  Text("$Email",
                      style: TextStyle(fontSize: 13,color: Colors.white)),
                  Text("$phno",
                      style: TextStyle(fontSize: 13,color: Colors.white)),

                ],
              ),
            )
          ],)
        ),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Flexible(
            child: ListView.builder(

              itemCount: _messages.length,
              itemBuilder: (context, index) => _messages[index],
              reverse: false, // Display new messages at the bottom
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).canvasColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Type your response',
                ),
              ),
            ),
            IconButton(
              icon:  Icon(Icons.send,color: themeBlue),
              onPressed: () { _handleSubmitted(_textController.text);
                sound.playSound();
              }
            ),
          ],
        ),
      ),
    );
  }
}


class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;
  final Widget? customWidget;
  final TextStyle? textStyle; // New parameter for text style

  ChatMessage({required this.text, required this.isUser, this.customWidget,this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white10,  // Change background color to white
        borderRadius: isUser ? BorderRadius.only(topLeft: Radius.circular(20)) : BorderRadius.only(topRight: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.center : MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 1.0),
          Expanded(
            child: Column(
              crossAxisAlignment: isUser ? CrossAxisAlignment.start : CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  isUser ? '' : '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2.0),
                  padding: const EdgeInsets.all(8.0),
                  child: customWidget ?? Text(
                    text,
                    style: const TextStyle(color: Colors.black),  // Change text color if needed
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class Question {
  final String question;
  final String responseKey;

  Question(this.question, this.responseKey);
}
