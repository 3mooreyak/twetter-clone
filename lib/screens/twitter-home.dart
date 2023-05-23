import 'package:flutter/material.dart';
import 'package:twitter/appbar-navbar/twitter.dart';
import 'package:twitter/screens/posts.dart';
import 'package:twitter/screens/profile-users.dart';
import 'package:twitter/screens/twittter7.dart';
import 'package:twitter/screens/profile-users.dart';

import '../data/data.dart';

class TweetScreen extends StatefulWidget {
  const TweetScreen({super.key});

  @override
  State<TweetScreen> createState() => _TweetScreenState();
}

class _TweetScreenState extends State<TweetScreen> {
  int selectedindex = 0;
  bool FavoriteIcon = true;
  bool RetweetIcon = true;
  bool CommentIcon = true;
  bool ShareIcon = true;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemCount: tweets.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Posts(
                            user: tweets[index].UserName,
                            id: tweets[index].IdName,
                            image: tweets[index].Images,
                            text: tweets[index].Text,
                            profileImage: tweets[index].ImageProfile,
                          )));
            },
            child: Card(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tweetsProfilePage(
                                      tweetsProfile: tweets[index].ImageProfile,
                                    )),
                          );
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            tweets[index].ImageProfile,
                          ),
                          radius: 20,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        tweets[index].UserName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(tweets[index].IdName),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          tweets[index].Text,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    tweets[index].Images,
                    height: 150,
                    width: 350,
                    fit: BoxFit.fill,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              CommentIcon = !CommentIcon;
                            });
                          },
                          child: Icon(Icons.comment_outlined,
                              color: CommentIcon ? null : Colors.blue)),
                      InkWell(
                          onTap: () {
                            setState(() {
                              FavoriteIcon = !FavoriteIcon;
                            });
                          },
                          child: Icon(Icons.restart_alt_outlined,
                              color: FavoriteIcon ? null : Colors.green)),
                      InkWell(
                          onTap: () {
                            setState(() {
                              RetweetIcon = !RetweetIcon;
                            });
                          },
                          child: Icon(Icons.favorite_outline,
                              color: RetweetIcon ? null : Colors.red)),
                      InkWell(
                          onTap: () {
                            setState(() {
                              ShareIcon = !ShareIcon;
                            });
                          },
                          child: Icon(Icons.share_outlined,
                              color: ShareIcon ? null : Colors.yellow)),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
