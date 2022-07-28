import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/presentations/screens/start/widgets/start_page_bottom_sheet.dart';
import 'package:todo_app/utilities/animated_app_icon.dart';
import 'package:todo_app/utilities/app_bar.dart';
import 'package:todo_app/utilities/cookies_class.dart';
import 'package:todo_app/utilities/gradient_bg.dart';

class GetStart extends StatefulWidget {
  @override
  _GetStart createState() => _GetStart();
}
//---------------------------------------------------------

class _GetStart extends State<GetStart> {
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
      bottomSheet: const StartPageBottomSheet(),
      body: Stack(children: [
        const GradientBg(),
        Column(
          children: [
            CustomAppBarUpdated(
              lang: lang,
              leadingWidget: BackIconAppBar(
                lang: lang,
                color: OwnColors.colorPalette['black'],
              ),
            ),
            AnimatedAppIcon(
              columnAxis: 'top',
              lang: lang,
            ),
          ],
        ),
      ]),
    );
  }
}
