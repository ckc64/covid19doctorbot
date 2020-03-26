import 'package:covid19doctorchatbot/chatbot/chadata.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}
  final messages = [];
class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  int chatIndex,index;
    String messageTxt;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
     messages.add("bot:Hello, How may I help you ?");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          title: Text(
            "COVID-19 DOCTOR BOT",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
            )
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: ()=>print(messages),
              icon: Icon(Icons.account_box),
            )
          ],
        ),
        body: SafeArea(
         
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            
            Column(
                children: <Widget>[
              Container(
                height: 65,
                color: Colors.grey[200],
                child: ListView.builder(
                  itemCount: userFirstQuestions.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                  
                      
                
                    return InkWell(
                      onTap: (){
                        setState(() {
                          
                          messageController.text = userFirstQuestions[index];
                         
                          chatIndex = index;
                        
                          
                        });
                      },
                      child: QuestionsBubble(text: userFirstQuestions[index],),
                    );
                  },
                ),
              ),  
              Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: kMessageTextFieldDecoration,
                    
                    ),
                  ),
                  
                  FlatButton(
                    onPressed: () {
                      setState(() {
                            messages.add("user:"+messageController.text);
                            
                          
                         
                            String messageReply = "";
                            var rnd = new Random();
                            
                          
                              if(userFirstQuestions.contains(messageController.text)){
                                messages.add("bot:"+botFirstAnswer[chatIndex]);
                                 
                               
                              }    else if(messageController.text.toLowerCase().contains("hello") || messageController.text.toLowerCase().contains("hi")){
                                messages.add("bot:Hi, I am your bot doctor for COVID-19");

                            }
                              
                              else{
                                   messageReply = defaultChat[rnd.nextInt(defaultChat.length)];
                                  messages.add("bot:"+messageReply);
                              }
                          
                             messageController.clear();
                             messageReply = defaultChat[rnd.nextInt(defaultChat.length)];
                           

                      });
                   
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                    
                  ),
                ],
              ),
            ),
                ],
            )
          
          ],
        ),
      ),
    );
  }
}



class MessagesStream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
                   
                List<MessageBubble>messageBubbles = [];
                for(var message in messages){
                    final messageText = message.toString().split(":");

                    final messageBubble = MessageBubble(
                      sender: message.contains("user:") ? "user" : "bot",
                      text: messageText[1],
                      isMe: message.contains("user:") ? true : false,
                    
                    );
                  
                    messageBubbles.add(messageBubble);
                }
                
                return Expanded(
                     child: ListView(
                       padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                       reverse: true,
                    children:messageBubbles.reversed.toList(),
                  ),
                );    
  }
}
class QuestionsBubble extends StatelessWidget {

  final String text;

  const QuestionsBubble({Key key, this.text}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Material(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              elevation: 0,
              color:Colors.green ,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                    child: Text(
                "$text",
                style: TextStyle(
                    color: Colors.white ,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                ),
              ),
                  ),
            ),
         
          ],
        ),
      );
    
  }
}

class MessageBubble extends StatelessWidget {

  final String sender,text;
  final bool isMe;
  const MessageBubble({Key key, this.sender, this.text,this.isMe}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            borderRadius: isMe ? BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30.0) 
            ,bottomRight: Radius.circular(30.0)):BorderRadius.only(topRight: Radius.circular(30),bottomLeft: Radius.circular(30.0) 
            ,bottomRight: Radius.circular(30.0)),
            elevation: 5.0,
            color: isMe ? Colors.green : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                  child: Text(
              "$text",
              style: TextStyle(
                  color: isMe? Colors.white : Colors.black,
                  fontSize: 15.0,
              ),
            ),
                ),
          ),
       
        ],
      ),
    );
  }
}

const kSendButtonTextStyle = TextStyle(
  color: Colors.green,
  fontWeight: FontWeight.bold,
  fontFamily: 'Montserrat-Bold',
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.green, width: 2.0),
  ),
);