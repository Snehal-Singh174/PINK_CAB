import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSection extends StatefulWidget {
  final String lati, lngi;
  HelpSection({Key key, this.lati, this.lngi}) : super(key: key);
  @override
  _HelpSectionState createState() => _HelpSectionState();
}

class _HelpSectionState extends State<HelpSection> {



  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      _getlocation(widget.lati.toString(),widget.lngi.toString());
                    },
                    child: Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,

                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 20,offset: Offset(0,10)
                            )
                          ]
                      ),                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        Text('Find us on Google Maps',textAlign: TextAlign.center,)
                      ],
                    ),
                    ),
                  ),
                )
              ],
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
