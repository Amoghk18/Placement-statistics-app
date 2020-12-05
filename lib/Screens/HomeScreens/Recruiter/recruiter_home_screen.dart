import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:placement_stats/Screens/DetailScreens/recruiter/campus_placment_screen.dart';
import 'package:placement_stats/Screens/DetailScreens/recruiter/company_reg.dart';
import 'package:placement_stats/Screens/DetailScreens/recruiter/forgot_pass.dart';
import 'package:placement_stats/Screens/DetailScreens/recruiter/pre_placement_talks_screen.dart';
import 'package:placement_stats/Screens/DetailScreens/recruiter/profile_screen.dart';
import 'package:placement_stats/Screens/DetailScreens/recruiter/success_stories_screen.dart';
import 'package:placement_stats/Widgets/Recruiter/already_recruited.dart';
import 'package:placement_stats/home_page.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/recruiter-home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _redirect(String route) {
    switch (route) {
      case "campus-placement":
        Navigator.of(context).pushNamed(CampusPlacementScreen.routeName);
        break;
      case "company-registration":
        Navigator.of(context).pushNamed(CompanyRegScreen.routeName);
        break;
      case "success-stories":
        Navigator.of(context).pushNamed(SuccessStoriesScreen.routeName);
        break;
      case "pre-placement-talk":
        Navigator.of(context).pushNamed(PrePlacementTalkScreen.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    var cardTextStyle = TextStyle(fontSize: 14, color: Colors.white);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "RecruitEZ",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProfileScreenRecruiter.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
              child: CircleAvatar(
                radius: 20,
                child: FittedBox(
                  child: Text("RN"),
                ),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.yellow[200],
              child: ExpansionTile(
                title: Text(
                  "Why BMSCE ?...",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
                backgroundColor: Colors.black,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 30, 10),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text("Learn more!"),
                        textColor: Colors.black,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    "DashBoard",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 16, 0),
                  height: 80,
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
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              InkWell(
                onTap: () => _redirect("campus-placement"),
                child: Card(
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
                            image: AssetImage("assets/images/placement.png"),
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
              ),
              InkWell(
                onTap: () => _redirect("company-registration"),
                child: Card(
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
                            image: AssetImage("assets/images/company_reg.png"),
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
              ),
              InkWell(
                onTap: () => _redirect("success-stories"),
                child: Card(
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
                            image: AssetImage("assets/images/success.png"),
                          ),
                        ),
                        height: 120,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Success Stories',
                        style: cardTextStyle,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => _redirect("pre-placement-talk"),
                child: Card(
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
                            image:
                                AssetImage("assets/images/placementtalk.png"),
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
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: AlreadyRecruited(),
          ),
          SliverToBoxAdapter(
            child: Divider(
              thickness: 2,
              endIndent: 50,
              indent: 50,
              color: Colors.black,
              height: 50,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Profile",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Colors.indigo),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ProfileScreenRecruiter.routeName);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ListTile(
                  leading: Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 25,
                  ),
                  title: Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ForgotPasswordRecruiter.routeName,
                  arguments: {"from": "update"},
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ListTile(
                  leading: Icon(
                    Icons.update,
                    color: Colors.black,
                    size: 25,
                  ),
                  title: Text(
                    "Update Password",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(HomePage.routeName);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                    size: 25,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              thickness: 2,
              endIndent: 50,
              indent: 50,
              color: Colors.black,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
