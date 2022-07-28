import 'package:flutter/material.dart';
import 'package:todo_app/presentations/screens/splash/widgets/splash_icon.dart';
import 'package:todo_app/utilities/cookies_class.dart';
import 'package:todo_app/utilities/gradient_bg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? clientID = "";
  bool firstLoad = true;

  String? lang;

  Future<String?> getLang() async {
    return await getValuesSF("lang");
  }

  Future<String?> getClient() async {
    return await getValuesSF("clientID");
  }

  Future<String?> getFirstLoad() async {
    return await getValuesSF("firstLoad");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getClient().then((value) {
      clientID = value;
    });

    getFirstLoad().then((value) {
      if (value == '' || value == 'false') {
        firstLoad = true;
      } else {
        firstLoad = false;
      }

      getLang().then((value) {
        setState(() {
          lang = value;
        });
      });

      Future.delayed(const Duration(seconds: 3), () {
        if (firstLoad) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/lang', (Route<dynamic> route) => false);
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/home', (Route<dynamic> route) => false);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [const GradientBg(), SplashIcon(lang: lang)],
    ));
  }
}
