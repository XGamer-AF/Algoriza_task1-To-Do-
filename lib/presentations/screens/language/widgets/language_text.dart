import 'package:flutter/material.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/lang/localizations.dart';

class LanguageText extends StatelessWidget {
  const LanguageText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Text(AppLocalizations.of(context)!.LangMain1,
            style: OwnColors.bigBlackLight("ar")),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: space1),
          child: Text(AppLocalizations.of(context)!.LangMain2,
              style: OwnColors.bigBlackLight("en")),
        ),
      ]
    );
  }
}
