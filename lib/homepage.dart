import 'package:day_27/customerdetails.dart';
import 'package:day_27/driverdetails.dart';
import 'package:day_27/getlocation.dart';
import 'package:day_27/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final firestoreInstance = FirebaseFirestore.instance;

  String username,email,image;

  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('userId');
      print(prefs.containsKey("userId"));
      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn()));
    } catch (e) {
      //print(e.toString());
    }
  }

  getUserDetails() async {
    var user = _auth.currentUser;
    print(user.uid);
    email = user.email;
    image = user.photoURL;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetails();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("PINK CAB"),backgroundColor: Color(0xFFF48FB1),),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              //accountName: Text(username!=null?username:"example"),
              accountEmail: Text(email!=null?email:"example@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: (image!=null)?Image.network(image,fit: BoxFit.fill,):Image.network(
                "https://previews.123rf.com/images/lineartist/lineartist1907/lineartist190702409/127623033-doing-office-work-on-laptop-cute-girl-cartoon-character-vector-illustration.jpg",
              ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFF48FB1),
              ),
            ),
            ListTile(
              title: Text('Driver Details'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DriverDetails()));
              },
            ),

            ListTile(
              title: Text('Customer Details'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerDetails()));
              },
            ),
            ListTile(
              title: Text('Live Locations'),
              onTap: () {
                // Update the state of the app
                // ...
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GetLocationWidget()));
    // Then close the drawer
              },
            ),

            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Update the state of the app
                // ...
                _logout(context);
                // Then close the drawer
              },
            ),
          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Image.asset("assets/a.png",),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text("PinkCab is driving women towards\n safety and empowerment",
                  style: TextStyle(
                    color: Color(0xFFF48FB1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.white,
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Image.asset("assets/b.png",),
              ),
              Container(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Text("Have a safe and secure ride.",
                  style: TextStyle(
                    color: Color(0xFFF48FB1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

