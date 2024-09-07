import 'package:flutter/material.dart';
import 'package:movies_app/app_colors.dart';
import 'package:movies_app/home/home-tap/home_tap.dart';
import 'package:movies_app/home/search-tap/search.dart';
import 'package:movies_app/home/watch_list-tap/watchList_tab.dart';

import 'browse-tap/browse_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index){
            selectedIndex = index;
            setState(() {

            });
          },
          items: const [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/Home icon.png')),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
          BottomNavigationBarItem(icon:  ImageIcon(AssetImage('assets/images/Browse.png')),label: 'Browse'),
          BottomNavigationBarItem(icon:  ImageIcon(AssetImage('assets/images/Icon bookmarks.png')),label: 'watch list'),
        ],),
      ) ,
      body: tabs[selectedIndex],
    );
  }
  List <Widget> tabs = [
    HomeTab(),SearchTap(),BrowseTap(),WathchListTap()
  ];
}
