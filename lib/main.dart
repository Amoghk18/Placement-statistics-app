import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_stats/OnBoardingScreens/recruiter/onBoarding.dart';
import 'package:placement_stats/OnBoardingScreens/student/onBoarding.dart';
import 'package:placement_stats/Providers/Chart.dart';
import 'package:placement_stats/Providers/CompanyYear.dart';
import 'package:placement_stats/Providers/Hiring_process.dart';
import 'package:placement_stats/Providers/Schedule.dart';
import 'package:placement_stats/Screens/AuthScreens/login_screen.dart';
import 'package:placement_stats/Screens/AuthScreens/login_screen_recruiter.dart';
import 'package:placement_stats/Screens/AuthScreens/signUp_recruiter.dart';
import 'package:placement_stats/Screens/AuthScreens/signUp_student.dart';
import 'package:placement_stats/Screens/DetailScreens/recruiter/campus_placment_screen.dart';
import 'package:placement_stats/Screens/DetailScreens/recruiter/company_reg.dart';
import 'package:placement_stats/Screens/DetailScreens/recruiter/forgot_pass.dart';
import 'package:placement_stats/Screens/DetailScreens/recruiter/pre_placement_talks_screen.dart';
import 'package:placement_stats/Screens/DetailScreens/recruiter/profile_screen.dart';
import 'package:placement_stats/Screens/DetailScreens/recruiter/success_stories_screen.dart';
import 'package:placement_stats/Screens/DetailScreens/student/Hiring_process_screen.dart';
import 'package:placement_stats/Screens/DetailScreens/student/chart_detail_screen.dart';
import 'package:placement_stats/Screens/DetailScreens/student/experience_detail.dart';
import 'package:placement_stats/Screens/DetailScreens/student/forgot_password.dart';
import 'package:placement_stats/Screens/DetailScreens/student/placement_stats_screen.dart';
import 'package:placement_stats/Screens/DetailScreens/student/profile_screen.dart';
import 'package:placement_stats/Screens/DetailScreens/student/resource_screen.dart';
import 'package:placement_stats/Screens/DetailScreens/student/share_your_experience_screen.dart';
import 'package:placement_stats/Screens/DetailScreens/student/upcoming_schedule.dart';
import 'package:placement_stats/Screens/HomeScreens/Recruiter/recruiter_home_screen.dart';
import 'package:placement_stats/Screens/HomeScreens/Student/home_screen.dart';
import 'package:placement_stats/home_page.dart';
import 'package:provider/provider.dart';

import 'Providers/Blog.dart';
import 'Providers/Course.dart';
import 'Providers/Ebook.dart';
import 'Providers/Experience.dart';
import 'Providers/Link.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Experience()),
        ChangeNotifierProvider(create: (ctx) => Chart()),
        ChangeNotifierProvider(create: (ctx) => Blog()),
        ChangeNotifierProvider(create: (ctx) => Course()),
        ChangeNotifierProvider(create: (ctx) => Ebook()),
        ChangeNotifierProvider(create: (ctx) => Link()),
        ChangeNotifierProvider(create: (ctx) => Schedule()),
        ChangeNotifierProvider(create: (ctx) => CompanyYear()),
        ChangeNotifierProvider(create: (ctx) => HiringProcess()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.orange,
          accentColor: Colors.white,
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        routes: {
          HomePage.routeName: (ctx) => HomePage(),
          LoginForm.routeName: (ctx) => LoginForm(),
          SignUpRecruiter.routeName: (ctx) => SignUpRecruiter(),
          SignUpStudent.routeName: (ctx) => SignUpStudent(),
          LoginFormRecruiter.routeName: (ctx) => LoginFormRecruiter(),
          HomeScreenStudent.routeName: (ctx) => HomeScreenStudent(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          ExperienceDetailScreen.routeName: (ctx) => ExperienceDetailScreen(),
          ChartDetailScreen.routeName: (ctx) => ChartDetailScreen(),
          OnBoardingScreenStudent.routeName: (ctx) => OnBoardingScreenStudent(),
          OnBoardingScreenRecruiter.routeName: (ctx) =>
              OnBoardingScreenRecruiter(),
          ResourceScreen.routeName: (ctx) => ResourceScreen(),
          UpcomingScheduleScreen.routeName: (ctx) => UpcomingScheduleScreen(),
          ShareYourExpScreen.routeName: (ctx) => ShareYourExpScreen(),
          CompanyName.routeName: (ctx) => CompanyName(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          ForgotPasswordStudent.routeName: (ctx) => ForgotPasswordStudent(),
          ProfileScreenRecruiter.routeName: (ctx) => ProfileScreenRecruiter(),
          ForgotPasswordRecruiter.routeName: (ctx) => ForgotPasswordRecruiter(),
          CompanyRegScreen.routeName: (ctx) => CompanyRegScreen(),
          CampusPlacementScreen.routeName: (ctx) => CampusPlacementScreen(),
          PrePlacementTalkScreen.routeName: (ctx) => PrePlacementTalkScreen(),
          SuccessStoriesScreen.routeName: (ctx) => SuccessStoriesScreen(),
          CompanyDescription.routeName: (ctx) => CompanyDescription(),
        },
      ),
    );
  }
}
