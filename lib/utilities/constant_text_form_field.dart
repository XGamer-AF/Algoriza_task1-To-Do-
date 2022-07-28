import 'package:flutter/material.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/constants/theme.dart';

class ConstantTextFormField extends StatelessWidget {
  final String? text;
  final String? title;
  final String? lang;
  final Function? onClick;
  final Icon? icon;
  final Widget? widget;
  final Color? bgColor;

  const ConstantTextFormField(
      {Key? key,
      this.text,
      this.title,
      this.lang,
      this.onClick,
      this.icon,
      this.widget,
      this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: OwnColors.suitableBlackBold(lang),
        ),
        SizedBox(
          height: space1,
        ),
        GestureDetector(
          onTap: () {
            if (onClick != null) {
              onClick!();
            }
          },
          child: Container(
            padding: EdgeInsets.all(space2),
            decoration: BoxDecoration(
                color: bgColor ?? OwnColors.colorPalette['lightGray'],
                borderRadius: BorderRadius.circular(round)),
            child: widget != null
                ? widget
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        text ?? '',
                        style: OwnColors.normalGrayBold(lang),
                      ),
                      icon != null ? icon! : Container()
                    ],
                  ),
          ),
        ),
        SizedBox(
          height: space1,
        )
      ],
    );
  }
}
