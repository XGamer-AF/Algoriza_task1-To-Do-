import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/lang/localizations.dart';
import 'package:todo_app/presentations/screens/language/langugeMain.dart';

class CustomAppBarUpdated extends StatefulWidget {
  final String? title;
  final Widget? leadingWidget;
  final Widget? actionWidget;
  final String? lang;
  final EdgeInsets? customPadding;
  final bool withBorder;
  final Color? borderColor;

  CustomAppBarUpdated({
    this.title,
    this.leadingWidget,
    this.actionWidget,
    this.lang,
    this.customPadding,
    this.withBorder = false,
    this.borderColor,
  });

  @override
  _CustomAppBarUpdatedState createState() => _CustomAppBarUpdatedState();
}

class _CustomAppBarUpdatedState extends State<CustomAppBarUpdated> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: widget.withBorder
              ? Border(
                  bottom: BorderSide(
                      width: 0.2,
                      style: BorderStyle.solid,
                      color: widget.borderColor ??
                          OwnColors.colorPalette['gray']!))
              : null),
      child: Padding(
        padding: widget.customPadding ??
            EdgeInsets.only(
                top: top + MediaQuery.of(context).padding.top,
                bottom: space1,
                right: side,
                left: side),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    widget.leadingWidget != null
                        ? Row(
                            children: [
                              widget.leadingWidget!,
                              const SizedBox(
                                width: space1,
                              )
                            ],
                          )
                        : Container(),
                    Text(
                      widget.title ?? '',
                      style: OwnColors.titleBlackBig(widget.lang),
                    ),
                  ],
                ),
                widget.actionWidget ?? Container(),
              ],
            ),
          ],
        ),
      ),
      // ),
    );
  }
}

class BackIconAppBar extends StatelessWidget {
  final Color? color;
  final String? lang;

  const BackIconAppBar({Key? key, this.color, this.lang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: space1,
          bottom: space1,
          left: lang == null
              ? 0
              : lang == 'ar'
                  ? 0.0
                  : space1,
          right: lang == null
              ? 0
              : lang == 'en'
                  ? space1
                  : 0,
        ),
        child: Image.asset(
          lang == 'en'
              ? 'assets/images/app_bar/back_en.webp'
              : 'assets/images/app_bar/back_ar.webp',
          width: arrow_width,
          height: arrow_height,
          color: color != null ? color : null,
        ),
      ),
    );
  }
}

class CloseIconAppBar extends StatelessWidget {
  final Color? color;
  final String? lang;

  const CloseIconAppBar({Key? key, this.color, this.lang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.pushNamed(context, '/welcome');
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: space1,
          bottom: space1,
          left: lang == null
              ? 0
              : lang == 'en'
                  ? 0.0
                  : space1,
          right: lang == null
              ? 0
              : lang == 'en'
                  ? space1
                  : 0,
        ),
        child: Image.asset(
          'assets/common/close_icon.webp',
          width: 15,
          height: 15,
          color: color != null ? color : null,
        ),
      ),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;

  const AnimatedLogo({Key? key, this.width, this.height, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo_animated.gif',
      width: width ?? MediaQuery.of(context).size.width / 4,
      height: height ?? MediaQuery.of(context).size.width / 4,
      color: color,
    );
  }
}

class LanWidgetAppbar extends StatelessWidget {
  final String? screen;
  final String? lang;

  const LanWidgetAppbar({Key? key, this.screen, this.lang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LanguageMain(
                      screen: screen,
                    )));
      },
      child: Text(
        AppLocalizations.of(context)!.lang,
        style: OwnColors.suitableBlackBold(lang),
      ),
    );
  }
}
