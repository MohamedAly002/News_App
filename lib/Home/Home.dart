import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/Tabs/Home_Tab.dart';
import 'package:news_app/Tabs/Setting/Setting_Tab.dart';
import 'package:news_app/Theme/my_theme.dart';
import '../Tabs/Categories_Tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            Stack(
              children: [
                tabs[_selectedindex],
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Colors.grey.shade900),
                    child: Padding(
                      padding: const EdgeInsets.all(9),
                      child: GNav(
                          backgroundColor: Colors.grey.shade900,
                          padding: EdgeInsets.all(10),
                          rippleColor:
                          Colors.grey.shade800, // tab button ripple color when pressed
                          hoverColor: Colors.grey.shade700, // tab button hover color
                          haptic: true, // haptic feedback
                          tabBorderRadius: 30,
                          tabActiveBorder: Border.all(
                              color: Colors.black, width: 1), // tab button border
                          // tabBorder: Border.all(color: MyTheme.Primarycolor, width: 1), // tab button border
                          tabShadow: [
                            BoxShadow(color: Colors.grey.shade900, blurRadius: 8)
                          ], // tab button shadow
                          curve: Curves.easeOutExpo, // tab animation curves
                          duration: Duration(milliseconds: 300), // tab animation duration
                          gap: 8, // the tab button gap between icon and text
                          color: Colors.white, // unselected icon color
                          activeColor: Colors.black, // selected icon and text color
                          iconSize: 24, // tab button icon size
                          tabBackgroundColor:
                          MyTheme.Primarycolor, // selected tab background color
                          // padding: EdgeInsets.symmetric(horizontal: 20, vertical:10), // navigation bar padding
                          tabs: [
                            GButton(
                              padding: EdgeInsets.all(12),
                              icon: Icons.home_outlined,
                              text: AppLocalizations.of(context)!.home,
                            ),
                            GButton(
                              padding: EdgeInsets.all(12),
                              icon: Icons.menu_outlined,
                              text: AppLocalizations.of(context)!.categories,
                            ),
                            GButton(
                              padding: EdgeInsets.all(12),
                              icon: Icons.settings_outlined,
                              text: AppLocalizations.of(context)!.setting,
                            ),
                          ],
                          selectedIndex: _selectedindex,
                          onTabChange: (index) {
                            setState(() {
                              _selectedindex = index;
                            });
                          }),
                    ),
                  ) ,//rounded bottom navigation bar
                ),
              ],
            )
      ),
    );
  }
  List<Widget>tabs=[HomeScreen(),CategoriesScreen(),SettingScreen()];
}
