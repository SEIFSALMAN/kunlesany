import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import '../modules/convert/convert_view.dart';
import '../shared/cubits/appMode/app_mode_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../modules/education/education_view.dart';
import '../modules/home/home_view.dart';
import '../modules/settings/settings_view.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  var selectedIndex = 0;

  List pagesModules = [
    HomeView(),
    EducationView(),
    ProfileView()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pagesModules.elementAt(selectedIndex)),
      bottomNavigationBar: FlashyTabBar(
        items: [
           FlashyTabBarItem(icon: Icon(Icons.home,size: 30,color: Theme.of(context).iconTheme.color), title: Text( AppLocalizations.of(context)!.home,style: Theme.of(context).textTheme.bodyText2,)),
           FlashyTabBarItem(icon: Icon(Icons.menu_book,size: 30,color: Theme.of(context).iconTheme.color), title: Text( AppLocalizations.of(context)!.education,style: Theme.of(context).textTheme.bodyText2,)),
           FlashyTabBarItem(icon: Icon(Icons.person,size: 30,color: Theme.of(context).iconTheme.color), title: Text( AppLocalizations.of(context)!.settings,style: Theme.of(context).textTheme.bodyText2,)),
        ],
        selectedIndex: selectedIndex,
        onItemSelected: (i)=> setState(() {
          selectedIndex = i;
        }),
         animationDuration: Duration(milliseconds: 190),
        showElevation: false,
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        height: 55,
      ),
    );
  }
}
