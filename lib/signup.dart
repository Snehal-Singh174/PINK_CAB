import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'signin.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _username = new TextEditingController();
  TextEditingController _type = new TextEditingController();
  TextEditingController _mobile = new TextEditingController();

  final firestoreInstance = FirebaseFirestore.instance;
  Future<void> signup(BuildContext context) async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
      );
      firestoreInstance.collection("users").add(
          {
            'email': _email.text,
            'password':_password.text,
            'displayName': _username.text,
            'photourl':null,
            'verify status' : null,
            'type': _type.text,
            'mobile_no': _mobile.text,

          }).then((value){
        print("ID: "+value.id);
      });
      setState(() {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("SignUp Successful now Please Login"),backgroundColor: Color(0xFFF48FB1),));
      });
    }catch(e){
      print(e);
    }
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
                          child: Image.asset("assets/wdriver.png"),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: size.height*0.05,
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "SignUp",
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
                                Icons.local_taxi,
                                color: Color(0xFFF48FB1),
                              ),
                              hintText: "Driver/Customer",
                              border: InputBorder.none,
                            ),
                            controller: _type,
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
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.call,
                                color: Color(0xFFF48FB1),
                              ),
                              hintText: "Mobile No.",
                              border: InputBorder.none,
                            ),
                            controller: _mobile,
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
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Color(0xFFF48FB1),
                              ),
                              hintText: "Username",
                              border: InputBorder.none,
                            ),
                            controller: _username,
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
                            onPressed: () async {
                              signup(context);},
                            child: Text(
                              "SIGNUP",
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
                              "Already have an Account ? ",
                              style: TextStyle(color: Color(0xFFF48FB1)),
                            ),
                            GestureDetector(
                              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));},
                              child: Text(
                                "Log In",
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