import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/lang/localizations.dart';
import 'package:todo_app/utilities/cookies_class.dart';
import 'package:todo_app/utilities/custom_button.dart';

class BoardingScreen extends StatefulWidget {
  @override
  _OnBoarding createState() => _OnBoarding();
}

class _OnBoarding extends State<BoardingScreen> {
  String? lang = '';
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? indicator(true, i) : indicator(false, i));
    }
    return list;
  }

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                top: top, right: side, left: side, bottom: space1),
            child: Row(
              mainAxisAlignment: lang == 'en'
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    if (_currentPage == _numPages - 1) {
                      Navigator.pushNamed(context, "/getStart");
                    } else {
                      var index = _numPages - 1;
                      setState(() {
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: OwnColors.colorPalette['secondary']!
                            .withOpacity(0.2),
                        borderRadius: BorderRadius.circular(round)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: space0, horizontal: space1),
                      child: Text(
                        AppLocalizations.of(context)!.skip_label,
                        style: OwnColors.suitableBlackBold(lang),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
            bottom: bottom, right: side, left: side, top: space2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: space2),
              child: CustomButton(
                onClick: () {
                  Navigator.pushNamed(context, "/getStart");
                },
                text: AppLocalizations.of(context)!.getStart_btn,
                textStyle: OwnColors.suitableWhite(lang),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: side),
        child: PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          children: [
            getField(
                AppLocalizations.of(context)!.slide1_title,
                AppLocalizations.of(context)!.slide1_desc,
                'assets/images/onboarding/slide1.png'),
            getField(
                AppLocalizations.of(context)!.slide2_title,
                AppLocalizations.of(context)!.slide2_desc,
                'assets/images/onboarding/slide2.png'),
            getField(
                AppLocalizations.of(context)!.slide3_title,
                AppLocalizations.of(context)!.slide3_desc,
                'assets/images/onboarding/slide3.png'),
          ],
        ),
      ),
    );
  }

  Widget getField(title, desc, imageSrc) {
    return Column(children: [

      Padding(
        padding: const EdgeInsets.symmetric(vertical: space1),
        child: Image.asset(
          imageSrc,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width * 0.9,
        ),
      ),
      Text(
        title,
        style: OwnColors.titleBlackBig(lang),
        textAlign: TextAlign.center,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: space1),
        child: Text(
          desc,
          style: OwnColors.paragraphNormalBlackMedium(lang!),
          textAlign: TextAlign.center,
        ),
      )
    ]);
  }

  Widget indicator(bool isActive, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        });
      },
      child: AnimatedContainer(
        duration: Duration(microseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        height: 7,
        width: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(round),
          color: isActive
              ? OwnColors.colorPalette['primary']
              : OwnColors.colorPalette['gray'],
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------
