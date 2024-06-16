import 'package:flutter/material.dart';
import 'package:flutter_apps_dashboard/app_constants.dart';
import 'package:flutter_apps_dashboard/screens/home/widgets/AppContainer.dart';
import 'package:flutter_apps_dashboard/screens/home/widgets/custom_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../resume_screen/resume_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.pageTitle,
  });

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(pageTitle),
        actionList: [ SizedBox(
          height: 100,
          width: 220 ,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade300, // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.5)),
              ),
              elevation: 5,
              shadowColor: Colors.purpleAccent,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Theme(
                    data: ThemeData(
                      appBarTheme: const AppBarTheme(
                        iconTheme: IconThemeData(
                          color: Colors.white, // Change this color as needed
                        ),                      ),
                    ),
                    child: ResumeScreen(),
                  ),
                ),
              );
              print('Fancy Button Pressed!');
            },
            child: Row(
              children: [
                Icon(Icons.person_outline_outlined, color:Colors.grey.shade600,),
                const SizedBox(width: 5),
                Text(
                  'View My Portfolio',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ),],

      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: const [
                /// PAYFOND
                Appcontainer(
                    iconData: Icons.payment_outlined,
                    title: AppConstants.payfondTitle,
                    subTitle: AppConstants.payfondSubTitle,
                    appURL: AppConstants.payfondAppURL,
                  desc: AppConstants.payfondDesc,),
                SizedBox(height: 24,),
                /// WEATHER
                Appcontainer(
                  hintText:AppConstants.weatherAppHint,
                  iconData: Icons.sunny_snowing,
                  title: AppConstants.weatherTitle,
                  subTitle: AppConstants.weatherSubTitle,
                  appURL: AppConstants.weatherAppURL,
                  desc: AppConstants.weatherAppDesc,),
                SizedBox(height: 24,),
                /// ORTHO TRADE
                Appcontainer(
                  iconData: Icons.medical_information_outlined,
                  title: AppConstants.OrthoTrade,
                  subTitle: AppConstants.OrthoTradeSubTitle,
                  appURL: AppConstants.OrthoTradeAppURL,
                  desc: AppConstants.OrthoTradeAppDesc,),
                SizedBox(
                  height: 24,
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 52,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(138, 170, 229, 1),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Amarnath Alavandar',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade300),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.grey.shade300, // Change the icon color
                        size: 12,
                        // Change the icon size
                      ),
                      SizedBox(width: 8),
                      Text(
                        '+1-312 799 0607',
                        style: TextStyle(
                          fontSize: 12, // Change the text size
                          fontWeight: FontWeight.bold, // Apply font weight
                          color: Colors.grey.shade300, // Change the text color
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
