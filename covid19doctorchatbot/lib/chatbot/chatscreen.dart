import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
    String messageTxt;
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
        ),
        body: SafeArea(
         
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
             MessagesStream(profileID: ""),
            
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: kMessageTextFieldDecoration,
                      onChanged: (value){
                        messageTxt = value;
                      },
                    ),
                  ),
                  
                  FlatButton(
                    onPressed: () async{
            
                       
                       messageController.clear();
                         
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
        ),
      ),
    );
  }
}


class MessagesStream extends StatelessWidget {
  final profileID;

  const MessagesStream({Key key, this.profileID}) : super(key: key);

  @override
  Widget build(BuildContext context) {


                final messages = [];
                List<MessageBubble>messageBubbles = [];
                for(var message in messages){
                    // final messageText = message.data['message'];
                    // final sender = message.data['sender'];
                    // final time = message.data['timestamp'];
                    // final currentUser = currentLoggedInEmail;
                    // final messageBubble = MessageBubble(
                    //   sender: sender,
                    //   text: messageText,
                    //   isMe: currentUser==sender,
                    
                    //   );
                    // messageBubbles.add(messageBubble);
                }
                return Expanded(
                     child: ListView(
                       padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                       reverse: true,
                    children:messageBubbles,
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
            color: isMe ? Colors.deepOrange : Colors.white,
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