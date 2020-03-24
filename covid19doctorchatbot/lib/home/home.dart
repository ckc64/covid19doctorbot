import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "COVID-19 DOCTOR BOT",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white
            )
          ),
          centerTitle: true,
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
                 padding: EdgeInsets.only(bottom:15),
                width: MediaQuery.of(context).size.width,
                child:Text("COVID-19 Cases: Philippines, as of March 24, 2020; 4:00 pm (PST)",
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular'
                ),
                )
              ),
              dataContainer(
                txtTitle: "CONFIRMED CASES",
                txtNumberOfCases: "123,456",
                icon: Icon(Icons.people,size: 50,color:Colors.deepOrange),
                colors: Colors.deepOrange
              ),
              SizedBox(height: 15,),
              dataContainer(
                txtTitle: "PUIs",
                txtNumberOfCases: "123,456",
                icon: Icon(Icons.radio_button_checked,size: 50,color:Colors.blue),
                colors: Colors.blue
              ),
               SizedBox(height: 15),
                  dataContainer(
                txtTitle: "PUMs",
                txtNumberOfCases: "123,456",
                icon: Icon(Icons.remove_red_eye,size: 50,color:Colors.indigo),
                colors: Colors.indigo
              ),
                SizedBox(height: 15),
                  dataContainer(
                txtTitle: "RECOVERED",
                txtNumberOfCases: "123,456",
                icon: Icon(Icons.accessibility_new,size: 50,color:Colors.green),
                colors: Colors.green
              ),
                 SizedBox(height: 15),
                  dataContainer(
                txtTitle: "DEATHS",
                txtNumberOfCases: "123,456",
                icon: Icon(Icons.airline_seat_individual_suite,size: 50,color:Colors.red),
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
               padding: EdgeInsets.all(17),
                width: MediaQuery.of(context).size.width,
                height: 100,
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
                    SizedBox(width: 10,),
                    Column(
                      children: <Widget>[
                            Container(
                      width: MediaQuery.of(context).size.width*.65,
                  
                      child: Text(txtTitle,
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w700,
                        fontSize: 20
                      ),
                      ),
                          ),
                                  Container(
                      width: MediaQuery.of(context).size.width*.65,
                  
                      child: Text(txtNumberOfCases,
                      style: TextStyle(
                        color:colors,
                        fontFamily: 'Montserrat-Bold',
                        fontSize: 30
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