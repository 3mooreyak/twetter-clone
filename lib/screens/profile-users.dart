import 'package:flutter/material.dart';
import 'package:twitter/model/user-model.dart';
import 'package:twitter/data/data.dart';
class tweetsProfilePage extends StatelessWidget {
  var tweetsProfile;
 
  tweetsProfilePage(
      {super.key,
     
      required this.tweetsProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.all(18.0),
            child: Image.asset(tweetsProfile),
          ),
          
        ],
      ),
      appBar: AppBar(),
    );
  }
}
