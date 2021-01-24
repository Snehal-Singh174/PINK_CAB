import 'package:day_27/welcome%20page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Builder(
        builder: (context)=> SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 55,left: 30,right: 30),
                  width: double.infinity,
                  height: size.height*0.5,
                  child: Image.asset("assets/p.png"),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: size.height*0.05,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "PINK CAB",
                    style: TextStyle(
                      color: Color(0xFFEC407A),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: size.height*0.09,
                  margin: EdgeInsets.only(top: 50,left: 20,right: 20),
                  child: Text(
                    "Women2Women CAB Service\nfor women safety and security",
                    style: TextStyle(
                      color: Color(0xFFF48FB1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 2,
                    ),
                  ),
                ),
                SizedBox(height: 100,),
                ClipOval(
                  child: Material(
                    color: Color(0xFFF48FB1), // button color
                    child: InkWell(
                      splashColor: Colors.red, // inkwell color
                      child: SizedBox(width: 76, height: 76, child: Icon(Icons.arrow_forward_ios,color: Colors.white,)),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

