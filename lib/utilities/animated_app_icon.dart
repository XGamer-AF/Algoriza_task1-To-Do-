import 'package:flutter/material.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/lang/localizations.dart';
import 'package:todo_app/utilities/app_bar.dart';

class AnimatedAppIcon extends StatelessWidget {
  final String? lang;
  final String columnAxis;

  const AnimatedAppIcon({Key? key, this.lang, required this.columnAxis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: columnAxis == 'top'
            ? MainAxisAlignment.start
            : columnAxis == 'center'
                ? MainAxisAlignment.center
                : MainAxisAlignment.end,
        children: [
          const AnimatedLogo(),
          const SizedBox(
            height: space1,
          ),
          Text(
            AppLocalizations.of(context)!.todo_label,
            style: OwnColors.splashTitleColor(lang),
          )
        ],
      ),
    );
  }
}
