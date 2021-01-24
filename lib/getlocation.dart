import 'package:day_27/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';


class GetLocationWidget extends StatefulWidget {
  const GetLocationWidget({Key key}) : super(key: key);

  @override
  _GetLocationState createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocationWidget> {
  final Location location = Location();

  LocationData _location;
  String _error;

  Future<void> _getLocation() async {
    setState(() {
      _error = null;
    });
    try {
      final LocationData _locationResult = await location.getLocation();
      setState(() {
        _location = _locationResult;
        print(_location.latitude);
        print(_location.longitude);
      });
    } on PlatformException catch (err) {
      setState(() {
        _error = err.code;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String lat = _location!=null?'${_location.latitude}':'Waiting Latitude';
    String lng = _location!=null?'${_location.longitude}':'Waiting Latitude';
    return Scaffold(
      appBar: AppBar(title: Text("PINK CAB"),backgroundColor: Color(0xFFF48FB1),),
      body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          //HelpSection(_location.latitude,_location.longitude,),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Image.asset("assets/l.png",),
          ),
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10,left: 30),
            width: size.width * 0.85,
            decoration: BoxDecoration(
                color: Color(0xFFF48FB1),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                )
            ),
            child: FlatButton(
              onPressed: (){
                _getlocation(lat, lng);
              },
              child: Text(
                "Fetch Location in Map",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          // Row(
          //   children: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.all(20.0),
          //       child: RaisedButton(
          //         child: const Text('Fetch Location'),
          //         onPressed: ()
          //         {
          //           _getlocation(lat, lng);
          //           //Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpSection(lati: lat, lngi: lng,)));
          //         },
          //       ),
          //     )
          //   ],
          // ),
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10,left: 90),
            child: Column(
              children: [
                _location!=null? Text('Latitude : ${_location.latitude}', style: TextStyle( fontSize: 20, color: Color(0xFFF48FB1)),) : Text('Waiting Latitude',style: TextStyle( fontSize: 20, color: Color(0xFFF48FB1)),),
                _location!=null? Text('Longitude : ${_location.longitude}',style: TextStyle( fontSize: 20, color: Color(0xFFF48FB1)),) : Text('Waiting Longitude',style: TextStyle( fontSize: 20, color: Color(0xFFF48FB1)),),

              ],
            ),
          ),

        ],
      ),
      ),
    );
  }
  void _getlocation(String lat, String lng) async{
    final String googleMapsUrl = "comgooglemaps://?center=$lat,$lng";
    final String appleMapsUrl = "https://maps.apple.com/?q=$lat,$lng";

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    }
    if (await canLaunch(appleMapsUrl)) {
      await launch(appleMapsUrl, forceSafariVC: false);
    } else {
      throw "Couldn't launch URL";
    }
  }
}
