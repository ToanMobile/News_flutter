import 'package:flutter/material.dart';
import 'package:news/res/colors.dart';
import 'package:news/res/text_styles.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileState();
}

class ProfileState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Text('ProfilePage', style: TextStylesUtils.styleAvenir20CoalGreyW600,),
          )
        ],
      ),
    );
  }

}
