import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';

import 'package:provider/provider.dart';

class FixedFooterColors {
  final Color backgroundColor;
  final Color foreground;

  FixedFooterColors({
    required this.backgroundColor,
    required this.foreground,
  });
}

class FixedFooterSizing {
  final double height;
  final double maxWidth;
  final EdgeInsets padding;

  FixedFooterSizing({
    required this.height,
    required this.maxWidth,
    required this.padding,
  });
}

class FixedFooter extends StatefulWidget {
  late FixedFooterSizing? sizing;
  late FixedFooterColors? colors;

  final Widget Function(
    BuildContext context,
    FixedFooterSizing? sizing,
    FixedFooterColors? colors,
  ) builder;

  FixedFooter({
    Key? key,
    required this.builder,
    this.sizing,
    this.colors,
  }) : super(key: key);

  @override
  State<FixedFooter> createState() => _FixedFooterState();
}

class _FixedFooterState extends State<FixedFooter> {
  @override
  void initState() {
    super.initState();
    if (widget.colors == null) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ThemeProvider theme =
            Provider.of<ThemeProvider>(context, listen: false);
        widget.colors = theme.colors.fixedFooterColors;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: ValueKey('footer'),
      child: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: widget.colors?.backgroundColor,
          height: widget.sizing?.height,
          alignment: Alignment.center,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: widget.sizing?.maxWidth ?? 800,
            ),
            padding: widget.sizing?.padding,
            child: Builder(
              builder: (context) => widget.builder(
                context,
                widget.sizing,
                widget.colors,
              ),
            ),
          ),
        ),
      ),
    );
  }
}