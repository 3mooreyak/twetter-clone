import 'package:flutter/material.dart';


class Post {
  String UserName;
  String IdName;
  String Text;
  String Images;
  String ImageProfile;

  Post(
      {required this.UserName,
      required this.IdName,
      required this.Images,
      required this.Text,
      required this.ImageProfile});
}
