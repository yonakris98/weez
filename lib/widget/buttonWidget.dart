import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  String label;
  dynamic onTap;
  double height;
  double width;
  double fontSize;
  Color fontColor;
  Color color;
  IconData icon;

  ButtonWidget({
    this.label,
    this.onTap,
    this.height,
    this.width,
    this.fontSize = 24,
    this.fontColor = Colors.white,
    this.color = Colors.blue,
    this.icon,
  });

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
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
        child: widget.icon == null
            ? Center(
                child: Text(
                  widget.label,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: widget.fontSize,
                      color: widget.fontColor),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      widget.icon,
                      color: widget.fontColor,
                    ),
                  ),
                  Text(
                    widget.label,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: widget.fontSize,
                        color: widget.fontColor),
                  ),
                ],
              ),
      ),
    );
  }
}
