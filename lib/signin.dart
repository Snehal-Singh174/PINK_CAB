import 'package:day_27/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'signup.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _email =new TextEditingController();
  TextEditingController _password =new TextEditingController();
  SharedPreferences prefs;


  Future<void> signin(BuildContext context) async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
      );
      prefs = await SharedPreferences.getInstance();
      prefs.setString('userId', userCredential.user.uid);
      print("uid:- "+prefs.getString('userId'));

    }catch(e){
      print(e);
    }
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => MainPage()),);

  }
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Builder(
            builder: (context)=>
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 15,left: 30,right: 30),
                          width: double.infinity,
                          height: size.height*0.4,
                          child: Image.asset("assets/des.png"),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: size.height*0.05,
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "LogIn",
                            style: TextStyle(
                              color: Color(0xFFF48FB1),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 10),
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Color(0xFFFCE4EC),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              )
                          ),
                          child: TextField(
                            onChanged: null,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.mail,
                                color: Color(0xFFF48FB1),
                              ),
                              hintText: "Your Email",
                              border: InputBorder.none,
                            ),
                            controller: _email,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Color(0xFFFCE4EC),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              )
                          ),
                          child: TextField(
                            onChanged: null,
                            obscureText: visible == false ? true : false,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Color(0xFFF48FB1),
                              ),
                              hintText: "Password",
                              border: InputBorder.none,
                              suffixIcon: _visible(),
                            ),
                            controller: _password,
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
                              signin(context);
                            },
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don’t have an Account ? ",
                              style: TextStyle(color: Color(0xFFF48FB1)),
                            ),
                            GestureDetector(
                              onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));},
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Color(0xFFF48FB1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
          )
      ),
    );
  }

  _visible() {
    return GestureDetector(
      onTap: ()
      {
        setState(() {
          visible = ! visible;
        });
      },
      child: visible==true? Icon(
        Icons.visibility_off,
        color: Color(0xFFF48FB1),
      ):Icon(
        Icons.visibility,
        color: Color(0xFFF48FB1),
      ),
    );
  }
}