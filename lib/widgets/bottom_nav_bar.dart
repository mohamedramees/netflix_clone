import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:netflix_clone/screens/new_and_hot_screen.dart';
import 'package:netflix_clone/screens/search_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: Container(
            color: Colors.black,
            height: 70,
            child: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(Icons.search),
                  text: "Search",
                ),
                Tab(
                  icon: Icon(Icons.photo_library_outlined),
                  text: "New & Hot",
                ),
              ],
              indicatorColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Color(0xff999999),
            ),
          ),
          body: const TabBarView(children: [
            HomeScreen(),
            SearchScreen(),
            NewAndHotScreen()
            ]
            ),
        )
        );
  }
}
