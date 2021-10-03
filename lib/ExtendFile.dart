import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';
import 'input_page.dart';

class ReusbleCode extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onClick;
  bool FeedBack;

  ReusbleCode({@required this.color, this.child, this.onClick, this.FeedBack});

  @override
  Widget build(BuildContext context) {
    if (FeedBack == null) FeedBack = false;
    return GestureDetector(
      onTap: FeedBack ? Feedback.wrapForTap(onClick, context) : onClick,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: child,
      ),
    );
  }
}

class getMaleFemale extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color logoColor;
  final Color FontColor;

  getMaleFemale(
      {@required this.icon,
      @required this.text,
      this.logoColor,
      this.FontColor});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: logoColor,
          //color: Color(0xFFd3d2d2),
        ),
        SizedBox(height: 15),
        Text(text, style: textStyle(FontColor))
      ],
    );
  }
}
