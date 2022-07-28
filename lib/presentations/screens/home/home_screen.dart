import 'package:flutter/material.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/data/models/task_types_model.dart';
import 'package:todo_app/lang/localizations.dart';
import 'package:todo_app/presentations/screens/all_tasks/all_tasks_screen.dart';
import 'package:todo_app/presentations/screens/completed_tasks/completed_tasks_screen.dart';
import 'package:todo_app/presentations/screens/fav_tasks/fav_tasks_screen.dart';
import 'package:todo_app/presentations/screens/uncompleted_tasks/uncompleted_tasks_screen.dart';
import 'package:todo_app/utilities/app_bar.dart';
import 'package:todo_app/utilities/cookies_class.dart';
import 'package:todo_app/utilities/custom_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? lang = '';
  List<TaskTypesModel> taskTypes = [];

  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  List<Widget> _pages = [
    AllTasksScreen(),
    CompletedTasksScreen(),
    UncompletedTasksScreen(),
    FavTasksScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskTypes = TaskTypesModel.fillTaskTypes();

    getLang().then((value) {
      setState(() {
        lang = value;
      });
    });
  }

  Future<String?> getLang() async {
    return await getValuesSF("lang");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
            top: space2, bottom: bottom, right: side, left: side),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              lang: lang,
              text: AppLocalizations.of(context)!.addTaskBtn,
              textStyle: OwnColors.btnWhite(lang),
              onClick: () {
                Navigator.pushNamed(context, "/addTask");
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBarUpdated(
              lang: lang,
              title: AppLocalizations.of(context)!.boardLabel,
              withBorder: true,
              actionWidget: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/tasksSchedule");
                      },
                      child: Icon(Icons.calendar_today)),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ...taskTypes.map((item) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        var rowIndex = taskTypes.indexOf(item);
                        _currentIndex = rowIndex;
                        selectedType();
                        _pageController.animateToPage(rowIndex,
                            duration: Duration(milliseconds: 100),
                            curve: Curves.bounceIn);
                      });
                    },
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(
                           space3
                        ),
                        child: Text(item.taskTypeName ?? ''),
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: item.isSelected! ? 2 : 0.2,
                                  style: BorderStyle.solid,
                                  color: item.isSelected!
                                      ? OwnColors.colorPalette['black']!
                                      : OwnColors.colorPalette['gray']!))),
                    ),
                  );
                })
              ]),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentIndex = page;
                        });
                        selectedType();
                      },
                      scrollDirection: Axis.horizontal,
                      children: _pages,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  int _currentIndex = 0;

  selectedType() {
    setState(() {
      for (var item in taskTypes) {
        item.isSelected = false;
      }
      taskTypes[_currentIndex].isSelected = true;
    });
  }
}
