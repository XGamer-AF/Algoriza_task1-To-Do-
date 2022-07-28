import 'package:flutter/material.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/presentations/screens/language/widgets/change_lang_btns.dart';
import 'package:todo_app/presentations/screens/language/widgets/language_text.dart';
import 'package:todo_app/utilities/animated_app_icon.dart';
import 'package:todo_app/utilities/cookies_class.dart';
import 'package:todo_app/utilities/gradient_bg.dart';

class LanguageMain extends StatefulWidget {
  final String? screen;

  const LanguageMain({Key? key, this.screen}) : super(key: key);

  @override
  _LanguageMainState createState() => _LanguageMainState();
}

class _LanguageMainState extends State<LanguageMain> {
  String? lang;

  Future<String?> getLang() async {
    return await getValuesSF("lang");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLang().then((value) {
      setState(() {
        lang = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBg(),
          Padding(
            padding: const EdgeInsets.only(right: side, left: side, top: top),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1),
                  child: AnimatedAppIcon(
                    columnAxis: 'top',
                    lang: lang,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: side, left: side, bottom: bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const LanguageText(),
                  ChangeLangBtns(screen: widget.screen)
                ],
              ),
            ),
            //------
          ),
        ],
      ),
    );
  }
}
