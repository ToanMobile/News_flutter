import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/res/resources.dart';

class BackgroundHeader extends StatelessWidget {
  final bool isFull;

  BackgroundHeader({this.isFull: false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topCenter,
      child: Image.asset(
        ImagesUtils.bgHeader,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
        height: isFull? DimensUtils.size200 : DimensUtils.size180,
      ),
    );
  }
}
