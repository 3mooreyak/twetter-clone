import 'package:flutter/material.dart';
import 'package:twitter/screens/twitter1.dart';
import 'package:twitter/screens/twittter2.dart';
import 'package:twitter/screens/twittter3.dart';
import 'package:twitter/screens/twittter4.dart';
import 'package:twitter/screens/twittter5.dart';
import 'package:twitter/screens/twittter6.dart';
import 'package:twitter/screens/twittter7.dart';
import 'package:twitter/model/user-model.dart';
import 'package:twitter/screens/twitter-home.dart';

import '../screens/twitter-home.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int currentPageIndex = 0;
bool toggel = false;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        title: currentPageIndex >= 4
            ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      toggel = true;
                    });
                  },
                  child: const Text('متابعة ',
                      style: TextStyle(color: Colors.blue)),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Image.asset(
                    'lib/images/logo.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      toggel = false;
                    });
                  },
                  child: const Text(
                    'لك  ',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ])
            : const SizedBox(),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
            child: Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'lib/images/sanjy.jpeg',
                  ),
                  radius: 15,
                )),
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.mail),
            label: 'massage',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'notifications',
          ),
          NavigationDestination(
            icon: Icon(Icons.mic),
            label: 'Live Chat',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'search',
          ),
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'home',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          child: const massage(),
        ),
        Container(
          child: const notifications(),
        ),
        Container(
          child: const LiveChat(),
        ),
        Container(
          child: const search(),
        ),
        Container(
          child: toggel ? const TweetScreen() : const Text('data'),
        ),
      ][currentPageIndex],
    );
    //   toolbarHeight: 100,
    //   title: Row(mainAxisAlignment: MainAxisAlignment.center,
    //  crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Image.asset(
    //         'lib/images/twitter.png',
    //         width: 50,
    //         height: 50,
    //       ), Image.asset('lib/images/nika.jpeg',height: 44,width: 33,),
    //       Row(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.stretch,),
    //     ],

    //   ),
  }
}
