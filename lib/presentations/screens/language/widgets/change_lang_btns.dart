import 'package:flutter/material.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/lang/localizations.dart';
import 'package:todo_app/presentations/screens/Intro.dart';
import 'package:todo_app/utilities/cookies_class.dart';
import 'package:todo_app/utilities/custom_button.dart';

class ChangeLangBtns extends StatelessWidget {
  final String? screen;

  const ChangeLangBtns({Key? key, this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          lang: 'ar',
          text: AppLocalizations.of(context)!.LangMain3,
          textStyle: OwnColors.btnWhite('ar'),
          bgColor: OwnColors.colorPalette['secondary'],
          onClick: () {
            addStringToSF("lang", "ar");
            Intro.setLocale(context, "ar");
            addStringToSF("lang", "ar").then((value) {
              if (value == 'ar') {
                if (screen != null) {
                  Navigator.pushReplacementNamed(context, '/$screen');
                } else {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/onBoarding', (Route<dynamic> route) => false);
                }
              }
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: space1),
          child: CustomButton(
              lang: 'en',
              text: AppLocalizations.of(context)!.LangMain4,
              textStyle: OwnColors.btnWhite('en'),
              bgColor: OwnColors.colorPalette['primary'],
              onClick: () async {
                addStringToSF("lang", "en");
                Intro.setLocale(context, "en");
                addStringToSF("lang", "en").then((value) {
                  if (value == 'en') {
                    if (screen != null) {
                      Navigator.pushReplacementNamed(context, '/$screen');
                    } else {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/onBoarding', (Route<dynamic> route) => false);
                    }
                  }
                });
              }),
        ),
      ],
    );
  }
}
