import 'package:flutter/material.dart';
import 'package:wealth_wise_app/pages/activities_page.dart';
import 'package:wealth_wise_app/pages/home_page.dart';
import 'package:wealth_wise_app/pages/settings_page.dart';

enum EPageOnSelect {
  homePage,

  newsPage,
  gamePage,
  activitiesPae,
  settingsPage
}

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
  });

  @override
  State<BottomBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.06)),
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if (page != EPageOnSelect.homePage) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                    (route) => false);
                page = EPageOnSelect.homePage;
                setState(() {});
              }
            },
            child: SizedBox(
                width: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == EPageOnSelect.homePage
                        ? Image.asset(
                            'assets/home2.png',
                          )
                        : Image.asset(
                            'assets/home.png',
                          ),
                    Text('Home',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w500,
                            color: page == EPageOnSelect.homePage
                                ? const Color(0xFF029BF4)
                                : Colors.black.withOpacity(0.4),
                            fontSize: 10))
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              if (page != EPageOnSelect.activitiesPae) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const ActivitiesPage()),
                    (route) => false);
                page = EPageOnSelect.activitiesPae;
                setState(() {});
              }
            },
            child: SizedBox(
                width: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == EPageOnSelect.activitiesPae
                        ? Image.asset(
                            'assets/activities2.png',
                          )
                        : Image.asset(
                            'assets/activities.png',
                          ),
                    Text('Activities',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w500,
                            color: page == EPageOnSelect.activitiesPae
                                ? const Color(0xFF029BF4)
                                : Colors.black.withOpacity(0.4),
                            fontSize: 10))
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              if (page != EPageOnSelect.settingsPage) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsPage()),
                    (route) => false);
                page = EPageOnSelect.settingsPage;
                setState(() {});
              }
            },
            child: SizedBox(
                width: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == EPageOnSelect.settingsPage
                        ? Image.asset(
                            'assets/settings.png',
                          )
                        : Image.asset(
                            'assets/settings2.png',
                          ),
                    Text('Settings',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w500,
                            color: page == EPageOnSelect.settingsPage
                                ? const Color(0xFF029BF4)
                                : Colors.black.withOpacity(0.4),
                            fontSize: 10))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
