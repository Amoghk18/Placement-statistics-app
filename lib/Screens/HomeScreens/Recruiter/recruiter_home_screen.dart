import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:placement_stats/Widgets/Recruiter/already_recruited.dart';
import 'package:placement_stats/Widgets/Recruiter/recruiter_app_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/recruiter-home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardTextStyle = TextStyle(fontSize: 14, color: Colors.white);

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: RecruiterDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
            child: CircleAvatar(
              radius: 20,
              child: FittedBox(
                child: Text("RN"),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "DashBoard",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 16, 0),
                    height: 90,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Recruiter Name',
                          style: TextStyle(
                              fontFamily: "Montserrat Medium",
                              color: Colors.black,
                              fontSize: 22),
                        ),
                        Text(
                          'HR Manager, Google',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "Montserrat Regular"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    primary: false,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Card(
                        color: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/placement.png"),
                                ),
                              ),
                              height: 128,
                            ),
                            Text(
                              'Campus Placement',
                              style: cardTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/company_reg.png"),
                                ),
                              ),
                              height: 120,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Company Registration',
                              style: cardTextStyle,
                            )
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/registration.png"),
                                ),
                              ),
                              height: 120,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Student Registration',
                              style: cardTextStyle,
                            )
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.teal,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/placementtalk.png"),
                                ),
                              ),
                              height: 120,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Pre-Placement Talks ',
                              style: cardTextStyle,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AlreadyRecruited(),
            ],
          ),
        ),
      ),
    );
  }
}
