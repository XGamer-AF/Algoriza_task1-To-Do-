import 'package:flutter/material.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/data/local_db/task_helper.dart';
import 'package:todo_app/data/models/task_model.dart';
import 'package:todo_app/lang/localizations.dart';
import 'package:todo_app/utilities/app_bar.dart';
import 'package:todo_app/utilities/cookies_class.dart';
import 'package:todo_app/utilities/custom_date_format.dart';
import 'package:todo_app/utilities/custom_horizontal_calendar.dart';

class TasksScheduleScreen extends StatefulWidget {
  const TasksScheduleScreen({Key? key}) : super(key: key);

  @override
  _TasksScheduleScreenState createState() => _TasksScheduleScreenState();
}

class _TasksScheduleScreenState extends State<TasksScheduleScreen> {
  String? lang = '';

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 365));
  DateTime selectedDate = DateTime.now();

  List<TaskModel> selectedTasks = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLang().then((value) {
      setState(() {
        lang = value;
      });
    });

    getTasks();

  }



  Future<String?> getLang() async {
    return await getValuesSF("lang");
  }

  getTasks() async {
    TaskHelper db = TaskHelper();
    var tmp = await db.getAll();
    selectedTasks = tmp
        .where((element) =>
            CustomDateFormat().ShortDate(element.taskDeadline, "en") ==
            CustomDateFormat().ShortDate(selectedDate.toString(), "en"))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBarUpdated(
                lang: lang,
                title: AppLocalizations.of(context)!.scheduleLabel,
                withBorder: true,
                leadingWidget: BackIconAppBar(
                  lang: lang,
                )),
            Padding(
              padding: const EdgeInsets.only(
                  top: space2, bottom: space1, right: side, left: side),
              child: CustomHorizontalCalendar(
                lang: lang,
                firstDate: startDate,
                selectedDate: startDate,
                endDate: endDate,
                dayOf: null,
                onChangeDate: (date) {
                  setState(() {
                    selectedDate = date!;
                  });
                  getTasks();
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 0.3,
                          style: BorderStyle.solid,
                          color: OwnColors.colorPalette['gray']!))),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: side, left: side, bottom: bottom),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: space2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            CustomDateFormat()
                                .fullDayOnly(selectedDate.toString(), lang),
                            style: OwnColors.suitableBlackBold(lang),
                          ),
                          Text(
                            CustomDateFormat().ShortDateWithMonth(
                                selectedDate.toString(), lang),
                            style: OwnColors.suitableBlackBold(lang),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        ...selectedTasks.map((task) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: space2),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(round),
                                color: Color(task.taskColor!),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(space1),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          task.startTime ?? '',
                                          style:
                                              OwnColors.suitableWhiteBold(lang),
                                        ),
                                        SizedBox(
                                          height: space1,
                                        ),
                                        Text(
                                          task.taskTitle ?? '',
                                          style:
                                              OwnColors.suitableWhiteBold(lang),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 2,
                                            style: BorderStyle.solid,
                                            color: OwnColors
                                                .colorPalette['white']!),
                                      ),
                                      child: task.taskStatus == 'completed'
                                          ? Icon(
                                              Icons.check,
                                              color: OwnColors
                                                  .colorPalette['white'],
                                            )
                                          : Container(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
