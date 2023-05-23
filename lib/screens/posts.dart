import 'package:flutter/material.dart';
import 'package:twitter/screens/twitter-home.dart';

class Posts extends StatefulWidget {
  var user;
  var id;
  var text;
  var image;
  var profileImage;
  Posts(
      {super.key,
      required this.user,
      required this.image,
      required this.text,
      required this.id,
      required this.profileImage});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  bool FavoriteIcon = true;
  bool RetweetIcon = true;
  bool CommentIcon = true;
  bool ShareIcon = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        height: 350,
        width: double.infinity,
        child: Card(
          color: Colors.white10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          widget.profileImage,
                        ),
                        radius: 20,
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.user,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.id,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.text,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  widget.image,
                  height: 150,
                  width: 300,
                ),
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
      ),
      appBar: AppBar(),
    );
  }
}
