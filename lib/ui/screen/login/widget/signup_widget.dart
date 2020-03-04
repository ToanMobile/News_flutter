import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news/config/router_manger.dart';
import 'package:news/generated/i18n.dart';
import 'package:news/res/text_styles.dart';

class SingUpWidget extends StatefulWidget {
  final nameController;

  SingUpWidget(this.nameController);

  @override
  _SingUpWidgetState createState() => _SingUpWidgetState();
}

class _SingUpWidgetState extends State<SingUpWidget> {
  TapGestureRecognizer _recognizerRegister;

  @override
  void initState() {
    _recognizerRegister = TapGestureRecognizer()
      ..onTap = () async {
        widget.nameController.text = await Navigator.of(context).pushNamed(RouteName.register);
      };
    super.initState();
  }

  @override
  void dispose() {
    _recognizerRegister.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text.rich(
        TextSpan(
          text: S.of(context).login_content1,
          style: TextStylesUtils.styleAvenir12BrownGreyW400,
          children: [
            TextSpan(
                text: S.of(context).signUp,
                recognizer: _recognizerRegister,
                style: TextStylesUtils.styleAvenir12PinkishOrangeW600),
            TextSpan(text: S.of(context).login_content2, style: TextStylesUtils.styleAvenir12BrownGreyW400)
          ],
        ),
      ),
    );
  }
}