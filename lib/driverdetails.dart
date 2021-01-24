import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DriverDetails extends StatefulWidget {
  @override
  _DriverDetailsState createState() => _DriverDetailsState();
}

class _DriverDetailsState extends State<DriverDetails> {
  FirebaseAuth auth = FirebaseAuth.instance;
  void fetch()async{
    CollectionReference collectionReference=FirebaseFirestore.instance.collection("drivers");
    DocumentSnapshot documentSnapshot=await collectionReference.doc("xQe5Th59NWTSgghaQTZg").get();
    //print(documentSnapshot.data()['name']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const double appPadding = 20.0;

    return Scaffold(
      appBar: AppBar(
        title: Text("Drivers Details"),
        backgroundColor: Color(0xFFF48FB1),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('drivers')
            .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
              var item = snapshot.hasData ? snapshot.data.docs : [];
              if(!snapshot.hasData){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              else{
                return ListView(
                  children: item.map((e) {
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Image.asset("assets/c.png",),
                          ),
                          Container(
                            margin: EdgeInsets.only(top:20),
                            padding: EdgeInsets.only(top: 20,bottom: 20),
                            height: size.height * 0.15,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 30.0,
                                      offset: Offset(10, 15))
                                ]
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 20,),
                                    Text(
                                      "Driver Name:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    Text(
                                      "${e['name']}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 20,),
                                    Text(
                                      "Mobile No.:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    Text(
                                      "${e['mobile_no']}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                      ],
                    ),
                    );
                  }).toList(),
                );
              }
            },
      ),
    );
  }
}
// StreamBuilder(
// stream: FirebaseFirestore.instance
//     .collection('drivers')
// .snapshots(),
// builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
// var item = snapshot.hasData ? snapshot.data.docs : [];
// if(snapshot.hasData){
// for(int i=0;i<item.length;i++){
// print(item[i]['name']);
// return Column(
// children: [
// ListTile(
// title: Text(
// item[i]['name']
// ),
// ),
// ListTile(
// title: Text(
// item[i]['mobile_no']
// ),
// ),
// ],
// );
// };
// }
// });