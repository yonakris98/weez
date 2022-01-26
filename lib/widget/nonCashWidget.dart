import 'package:flutter/material.dart';

class NonCashWidget extends StatefulWidget {
  String label;
  dynamic onTap;
  double height;
  double width;
  double fontSize;
  Color fontColor;
  Color color;
  String imagePath;

  NonCashWidget({
    this.label,
    this.onTap,
    this.height,
    this.width,
    this.fontSize = 24,
    this.fontColor = Colors.white,
    this.color = Colors.blue,
    this.imagePath,
  });

  @override
  _NonCashWidgetState createState() => _NonCashWidgetState();
}

class _NonCashWidgetState extends State<NonCashWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Image.asset(
            widget.imagePath,
            height: 60,
            width: 60,
          ),
        ),
      ),
    );
  }
}
