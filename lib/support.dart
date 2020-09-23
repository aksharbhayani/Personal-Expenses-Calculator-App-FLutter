import 'package:Personal_Expenses/widgets/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatelessWidget {
  final Function change;
  final Function textch;
  final Function bgchange;

  void _launchurl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Can\'t Launch URl';
    }
  }

  void _launchEmail(String emailid) async {
    var url = "mailto:$emailid";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'email error';
    }
  }

  Support(this.change, this.textch, this.bgchange);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgchange(),
      body: Stack(
        overflow: Overflow.visible,
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            //OvalBottomBorderClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(color: change()
                  // ? Colors.lightBlue[900].withOpacity(0.41)
                  //: Colors.yellowAccent[400]
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 65.0),
              child: Text('DEVELOPER',
                  style: TextStyle(
                    letterSpacing: 2,
                    color: textch(),
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    //fontFamily: 'OpenSans',
                  )),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 110),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                          BorderSide(color: textch(), width: 5))),
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/my_pho.png',
                    width: 250,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'AKSHAR BHAYANI',
                  style: TextStyle(
                      color: textch(),
                      fontSize: 25,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Quicksand'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
                child: Text(
                  'A Final Year B.Tech IT Student of Narsee Monjee Institute of Management Studies, Shirpur Campus.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textch(), fontSize: 17),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 1.2,
                  width: 210.0,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0, right: 0, top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Divider(
                      color: textch(),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        _launchurl("https://github.com/aksharbhayani");
                      },
                      elevation: 10.0,
                      fillColor: Colors.white,
                      child: Icon(MyFlutterApp.github,
                          color: Colors.black, size: 40),
                      padding: EdgeInsets.all(7.0),
                      shape: CircleBorder(),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        _launchurl(
                            "https://www.linkedin.com/in/aksharbhayani/");
                      },
                      elevation: 10.0,
                      fillColor: Colors.white,
                      child: Icon(MyFlutterApp.linkedin_squared,
                          color: Colors.blue, size: 40),
                      padding: EdgeInsets.all(7.0),
                      shape: CircleBorder(),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        _launchurl("https://wa.me/918128996501");
                      },
                      elevation: 10.0,
                      fillColor: Colors.white,
                      child: Icon(MyFlutterApp.whatsapp,
                          color: Colors.green, size: 40),
                      padding: EdgeInsets.all(7.0),
                      shape: CircleBorder(),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        _launchEmail("aksharbhayani261099@gmail.com");
                      },
                      elevation: 10.0,
                      fillColor: Colors.white,
                      child: Icon(MyFlutterApp.mail,
                          color: Colors.blue[900], size: 40),
                      padding: EdgeInsets.all(7.0),
                      shape: CircleBorder(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          _launchurl(
                              "https://www.instagram.com/aksharbhayani/");
                        },
                        elevation: 10.0,
                        fillColor: Colors.white,
                        child: Icon(MyFlutterApp.instagram,
                            color: Colors.pink, size: 40),
                        padding: EdgeInsets.all(7.0),
                        shape: CircleBorder(),
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          _launchurl(
                              "https://www.facebook.com/akshar.bhayani/");
                        },
                        elevation: 10.0,
                        fillColor: Colors.white,
                        child: Icon(MyFlutterApp.facebook,
                            color: Colors.blue[900], size: 40),
                        padding: EdgeInsets.all(7.0),
                        shape: CircleBorder(),
                      ),
                    ],
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
