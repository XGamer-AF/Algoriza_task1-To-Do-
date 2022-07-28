import 'package:flutter/material.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/lang/localizations.dart';
import 'package:todo_app/utilities/cookies_class.dart';
import 'package:todo_app/utilities/custom_button.dart';

class StartPageBottomSheet extends StatelessWidget {
  final String? lang;

  const StartPageBottomSheet({Key? key, this.lang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: bottom, top: space2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalizations.of(context)!.getStart1,
              style: OwnColors.hugeColorBold(lang)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: space1),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: AppLocalizations.of(context)!.getStart2 + ' ',
                    style: OwnColors.hugeColor2Bold(lang)),
                TextSpan(
                    text: AppLocalizations.of(context)!.getStart3,
                    style: OwnColors.hugeColorBold(lang)),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: side),
            child: CustomButton(
              lang: lang,
              text: AppLocalizations.of(context)!.getStart_btn,
              textStyle: OwnColors.btnWhite(lang),
              onClick: () {
                btnClick(context);
              },
            ),
          )
        ],
      ),
    );
  }
  void btnClick(context) async {
    addStringToSF("firstLoad", "true");

    Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

}

