import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/icons/legendGradientIcon.dart';
import 'package:webstore/customwidgets/input/selectBar/selectProvider.dart';
import 'package:webstore/styles/legendColorTheme.dart';

import 'legendSelectOption.dart';

class LegendIconButton extends StatefulWidget {
  final LegendSelectOption option;
  final void Function(LegendSelectOption option) onClick;
  final double size;
  late BoxShadow shadow;
  late Color? hoverColor;
  late Color backgroundColor;

  Gradient? gradient;

  LegendIconButton({
    required this.option,
    required this.size,
    required this.onClick,
  }) {
    backgroundColor = option.color ?? Colors.red;
    gradient = option.gradient;

    if (gradient != null) {
      backgroundColor = gradient!.colors.first;
    }

    shadow = BoxShadow(
      color: backgroundColor.withOpacity(0.2),
      spreadRadius: 2,
      blurRadius: 16,
      offset: Offset(0, 3),
    );
    hoverColor = LegendColorTheme.darken(
      backgroundColor,
      0.1,
    );
  }

  @override
  _LegendIconButtonState createState() => _LegendIconButtonState();
}

class _LegendIconButtonState extends State<LegendIconButton>
    with SingleTickerProviderStateMixin {
  late bool hovered;
  late Animation<Color?> animation;
  late Animation<double> shadowAnimation;
  late AnimationController controller;
  late Color? color;
  double shadow = 0.0;
  late bool selected;

  @override
  void initState() {
    super.initState();
    hovered = false;
    selected = false;
    color = widget.option.color;
    controller = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    animation =
        ColorTween(begin: widget.backgroundColor, end: widget.hoverColor)
            .animate(controller)
              ..addListener(
                () {
                  setState(() {
                    color = animation.value;
                  });
                },
              );
    shadowAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(
        () {
          setState(() {
            shadow = shadowAnimation.value;
          });
        },
      );
  }

  Widget normalIcon() {
    return Icon(
      widget.option.icon!,
      color: color,
      size: widget.size,
    );
  }

  Widget gradientIcon() {
    return GradientIcon(
      widget.option.icon!,
      widget.size,
      widget.gradient!,
    );
  }

  BoxShadow getShadow(Color? color) {
    BoxShadow old = widget.shadow;
    return BoxShadow(
      color: color?.withOpacity(0.2 + shadow * 0.02) ?? Colors.transparent,
      blurRadius: old.blurRadius + shadow * 1,
      offset: old.offset,
      spreadRadius: old.spreadRadius + shadow * 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LegendSelectProvider>(builder: (context, sel, c) {
      bool s = sel.selected.name == widget.option.name;
      print(s);
      if (s && !selected) {
        controller.forward();
        selected = true;
      } else if (!s && selected) {
        controller.reverse();
        selected = false;
      }
      return InkWell(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          widget.onClick(widget.option);
        },
        borderRadius: BorderRadius.all(
          Radius.circular(widget.size / 2),
        ),
        onHover: (value) {
          if (selected == false) {
            if (value && !hovered) {
              if (!controller.isAnimating || !hovered) {
                controller.forward();
                hovered = true;
              }
            } else {
              if (!controller.isAnimating || hovered) {
                controller.reverse();
                hovered = false;
              }
            }
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.size / 2),
            ),
            boxShadow: [
              getShadow(color),
            ],
          ),
          child: getIcon(),
        ),
      );
    });
  }

  Widget getIcon() {
    if (widget.option.gradient != null) {
      return gradientIcon();
    } else {
      return normalIcon();
    }
  }
}