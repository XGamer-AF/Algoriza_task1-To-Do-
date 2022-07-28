import 'package:flutter/widgets.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/constants/theme.dart';

class CustomButton extends StatefulWidget {
  final Function? onClick;
  final String? text;
  final String? lang;
  final bool? isLoading;
  final bool canSave;
  final Color? bgColor;
  final TextStyle? textStyle;
  final Border? border;
  final String? imgPath;
  final double radius;

  CustomButton({
    this.onClick,
    this.text,
    this.lang,
    this.isLoading = false,
    this.canSave = true,
    this.bgColor ,
    this.textStyle,
    this.border,
    this.imgPath,
    this.radius = round
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.isLoading != true) {
      return IgnorePointer(
        ignoring: widget.canSave ? false : true,
        child: GestureDetector(
          onTap: () {
            widget.onClick!();
          },
          child: Container(
            decoration: BoxDecoration(
                color: widget.canSave ? widget.bgColor ?? OwnColors.colorPalette['primary'] : OwnColors.colorPalette['gray'],
                borderRadius: BorderRadius.circular(widget.radius),
                border: widget.border),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: space2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.imgPath != null
                      ? Image.asset(widget.imgPath!,
                  width: 20,
                    height: 20,
                  )
                      : Container(),
                  SizedBox(
                    width: space1,
                  ),
                  Text(
                    widget.text ?? '',
                    style: widget.textStyle != null
                        ? widget.textStyle
                        : OwnColors.suitableWhiteBold(widget.lang),
                    maxLines: 1,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Center(child: Text(''));
    }
  }
}

