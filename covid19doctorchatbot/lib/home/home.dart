import 'package:covid19doctorchatbot/chatbot/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as prefix0;
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'dart:convert';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List counterCases = [];
  String deathCount="",caseCount="",recoveredCount="";
  List webDataOne = [];
  var now = new DateTime.now();


  Future<String> getCountData() async{
      String counterID = 'maincounter-number';
    var response = await http.get("https://www.worldometers.info/coronavirus/country/philippines/");
  var doc = parse(response.body);
   
   List<prefix0.Element> links = doc.getElementsByClassName(counterID);
   
   for( var link in links ){
    
      print(link.text.trim());
      setState(() {
          counterCases.add(link.text.trim());
      });
      
   }

      setState(() {
     caseCount = counterCases[0];
     deathCount = counterCases[1];
     recoveredCount = counterCases[2];
   });
  

  }


//https://www.doh.gov.ph/2019-nCov
 
  @override
  void initState() {
    // TODO: implement initState
    this.getCountData();
 
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen())),
          backgroundColor: Colors.green,
          child: Icon(
            Icons.chat
          ),
        ),
        appBar: AppBar(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                splashColor: Colors.green[600],
              onPressed: ()=>print("HELP"),
              icon: Icon(Icons.help_outline),
              iconSize: 30,
              color: Colors.white,
            ),
            )
          ],
        ),
        
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child:Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                 Container(
               
                width: MediaQuery.of(context).size.width,
                child:Text("COVID-19 Cases : ",
                style: TextStyle(
                  fontFamily: 'Montserrat-Bold',
                  fontSize: 20
                ),
                )
              ),
              Container(
                 padding: EdgeInsets.only(bottom:15),
                width: MediaQuery.of(context).size.width,
                child:Text("Philippines, as of "
                  + DateFormat.yMMMMd("en_US").add_jm().format(new DateTime.now().toLocal()),
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular'
                ),
                )
              ),
              dataContainer(
                txtTitle: "CONFIRMED CASES",
                txtNumberOfCases: caseCount,
                icon: Icon(Icons.people,size: 70,color:Colors.blue),
                colors: Colors.blue
              ),
         
                SizedBox(height: 15),
                  dataContainer(
                txtTitle: "RECOVERED",
                txtNumberOfCases: recoveredCount,
                icon: Icon(Icons.accessibility_new,size: 70,color:Colors.green),
                colors: Colors.green
              ),
                 SizedBox(height: 15),
                  dataContainer(
                txtTitle: "DEATHS",
                txtNumberOfCases: deathCount,
                icon: Icon(Icons.airline_seat_individual_suite,size: 70,color:Colors.red),
                colors: Colors.red
              ),
              
          
            ],
        ),
          ),
      ),
    );
  }

Widget dataContainer({String txtTitle,Icon icon,String txtNumberOfCases,Color colors}){

  return Container(
               padding: EdgeInsets.only(top:20,left:20),
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)
                  ),
                 boxShadow: [
                   
                   BoxShadow(
                  color: Colors.grey[300],
                
                  blurRadius: 7.0, // has the effect of softening the shadow
                  spreadRadius: 1, // has the effect of extending the shadow
                  offset: Offset(
                    3.0, // horizontal, move right 10
                    3.0, // vertical, move down 10
                ),
              )
                 ]
                 
                ),
                child: Row(
                  children: <Widget>[
                    icon,
                    SizedBox(width: 20,),
                    Column(
                      children: <Widget>[
                            Container(
                      width: MediaQuery.of(context).size.width*.50,
                  
                      child: Text(txtTitle,
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w700,
                        fontSize: 20
                      ),
                      ),
                          ),
                                  Container(
                      width: MediaQuery.of(context).size.width*.50,
                  
                      child: Text(txtNumberOfCases,
                      style: TextStyle(
                        color:colors,
                        fontFamily: 'Montserrat-Bold',
                        fontSize:100
                      ),
                      ),
                          ),
                      ],
                    )
                
                  ],
                ),
                
              );
}
 
}