import 'package:flutter/material.dart';
import 'package:news/res/text_styles.dart';

class BookmarkPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BookmarkState();
}

class BookmarkState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Text(
              'BookmarkPage',
              style: TextStylesUtils.styleAvenir20CoalGreyW600,
            ),
          )
        ],
      ),
    );
  }
}
