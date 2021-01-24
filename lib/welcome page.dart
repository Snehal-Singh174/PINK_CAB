import 'package:flutter/material.dart';
import 'signin.dart';
import 'signup.dart';
import 'signin.dart';
import 'signup.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 150,),
          Container(
            padding: EdgeInsets.only(top: 15,left: 30,right: 30),
            width: double.infinity,
            height: size.height*0.4,
            child: Image.asset("assets/welcome.png"),
          ),
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10),
            width: size.width * 0.85,
            decoration: BoxDecoration(
                color: Color(0xFFF48FB1),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                )
            ),
            child: FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn()));
              },
              child: Text(
                "I'M DRIVER",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10),
            width: size.width * 0.85,
            decoration: BoxDecoration(
                color: Color(0xFFF48FB1),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                )
            ),
            child: FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn()));
              },
              child: Text(
                "I'M CUSTOMER",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
