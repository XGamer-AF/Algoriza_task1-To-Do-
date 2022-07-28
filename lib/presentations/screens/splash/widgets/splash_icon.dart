import 'package:flutter/material.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/lang/localizations.dart';
import 'package:todo_app/utilities/app_bar.dart';

class SplashIcon extends StatelessWidget {
  final String? lang;

  const SplashIcon({Key? key, this.lang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
