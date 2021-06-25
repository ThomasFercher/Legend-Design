import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../styles/legendTheme.dart';

class FixedFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: ValueKey("footer"),
      child: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Center(child: Text("Footer")),
        ),
      ),
    );
  }
}
